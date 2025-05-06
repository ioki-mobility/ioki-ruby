# frozen_string_literal: true

require 'rspec/expectations'

API_SPECIFICATION_PATHS = {
  platform_api:  'spec/fixtures/open_api_definitions/platform_api.json',
  passenger_api: 'spec/fixtures/open_api_definitions/passenger_api.json',
  driver_api:    'spec/fixtures/open_api_definitions/driver_api.json',
  operator_api:  'spec/fixtures/open_api_definitions/operator_api.json',
  webhooks_api:  'spec/fixtures/open_api_definitions/webhooks_api.json'
}.freeze

API_SPECIFICATIONS =
  API_SPECIFICATION_PATHS.transform_values do |path|
    File.file?(path) ? JSON.parse(File.read(path)) : nil
  end.freeze

RSpec::Matchers.define :match_open_api_definition do |scope, model|
  define_method :schemas do
    API_SPECIFICATIONS.fetch(scope.to_sym).fetch('components').fetch('schemas')
  end

  define_method :schema_path do |actual_model|
    actual_model.schema_path ||
      "#{actual_model.specification_scope}--#{StringHelper.underscore(model.to_s.split('::').last)}"
  end

  define_method :model_node do |actual_model|
    schemas[schema_path(actual_model)]
  end

  define_method :specified_attributes do |actual_model|
    model_node(actual_model).fetch('properties').keys.map(&:to_sym) -
      unvalidated_attributes(actual_model) -
      deprecated_attributes(actual_model)
  end

  define_method :deprecated_attributes do |actual_model|
    model_node(actual_model).fetch('properties').select do |_name, attributes|
      attributes['deprecated']
    end.keys.map(&:to_sym)
  end

  define_method :defined_attributes do |actual_model|
    actual_model.attribute_definitions.keys - unvalidated_attributes(actual_model)
  end

  define_method :unvalidated_attributes do |actual_model|
    actual_model
      .attribute_definitions
      .select { |_key, definition| definition[:unvalidated] }
      .keys
  end

  match do |actual_model|
    return false if model_node(actual_model).nil?

    unless (defined_attributes(actual_model) & deprecated_attributes(actual_model)).empty?
      deprecated_attrs = defined_attributes(actual_model) | deprecated_attributes(actual_model)
      warn "The following attributes on #{actual_model} are deprecated: #{deprecated_attrs}."
    end

    specified_attributes(actual_model).sort == defined_attributes(actual_model).sort
  end

  failure_message do |actual_model|
    if model_node(actual_model).nil?
      <<~MESSAGE
        Specification not found for #{actual_model}. I was looking for: #{schema_path(actual_model)}. Available specifications:
        #{schemas.keys}
      MESSAGE
    else
      <<~MESSAGE
        expected that the model #{actual_model} would match the OpenAPI-specification, but there are differences.
        The attributes which are used in the model but which are not in the OpenAPI-specification are:
        #{(defined_attributes(actual_model) - specified_attributes(actual_model)).sort}
        The attributes which are not used in the model but which are in the OpenAPI-specification are:
        #{(specified_attributes(actual_model) - defined_attributes(actual_model)).sort}
        The attributes defined in the model are:
        #{defined_attributes(actual_model).sort}
        The attributes defined in the OpenAPI-specification are:
        #{specified_attributes(actual_model).sort}
      MESSAGE
    end
  end
end
