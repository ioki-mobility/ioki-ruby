# frozen_string_literal: true

require 'rspec/expectations'

API_SPECIFICATION_PATHS = {
  platform_api:  'spec/fixtures/open_api_definitions/platform_api.json',
  passenger_api: 'spec/fixtures/open_api_definitions/passenger_api.json',
  driver_api:    'spec/fixtures/open_api_definitions/driver_api.json'
}.freeze

API_SPECIFICATIONS =
  API_SPECIFICATION_PATHS.transform_values do |path|
    File.file?(path) ? JSON.parse(File.read(path)) : nil
  end.freeze

RSpec::Matchers.define :match_open_api_definition do |scope, model, options = {}|
  define_method :schemas do
    API_SPECIFICATIONS.fetch(scope.to_sym).fetch('components').fetch('schemas')
  end

  define_method :specification_scope do
    options[:specification_scope] || scope
  end

  define_method :schema_path do
    "#{specification_scope}--#{StringHelper.underscore(model.to_s.split('::').last)}"
  end

  define_method :model_node do
    schemas[schema_path]
  end

  define_method :specified_attributes do
    model_node.fetch('properties').keys.map(&:to_sym)
  end

  define_method :defined_attributes do |actual_model|
    actual_model.
      attribute_definitions.
      reject { |_key, definition| definition[:type] == :object }.
      select { |_key, definition| Array(definition[:on]).include?(:read) }.
      keys
  end

  match do |actual_model|
    return false if model_node.nil?

    (defined_attributes(actual_model) - specified_attributes).empty?
  end

  failure_message do |actual_model|
    if model_node.nil?
      <<~MESSAGE
        Specification not found for #{actual_model}. I was looking for: #{schema_path}. Available specifications:
        #{schemas.keys}
      MESSAGE
    else
      <<~MESSAGE
        expected that the model #{actual_model} would only define attributes defined in the open_api definition, but there are attributes in the model that are not in the specification.
        The unknown attributes are:
        #{(defined_attributes(actual_model) - specified_attributes).sort}.
        The attributes defined in the model were:
        #{defined_attributes(actual_model).sort}
        while the API defines:
        #{specified_attributes.sort}.
      MESSAGE
    end
  end
end
