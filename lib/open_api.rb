# frozen_string_literal: true

# This is the helper module to compare (and repair) the models with the OpenAPI definitions
module OpenApi
  require 'ioki'
  require 'json'

  class Model
    attr_accessor :specification, :ioki_model

    def initialize(specification, ioki_model)
      @specification = specification
      @ioki_model = ioki_model
    end

    def repair
      # puts model
      changed = false
      unspecified_model_attributes.each do |unspecified_model_attribute|
        comment_attribute_definition(unspecified_model_attribute)
        changed = true
      end
      deprecated_model_attributes.each do |deprecated_model_attribute|
        comment_attribute_definition(deprecated_model_attribute)
        changed = true
      end
      undefined_schema_attributes.each do |undefined_schema_attribute|
        add_attribute_definition(undefined_schema_attribute)
        changed = true
      end
      if changed
        save!
        # puts file_lines.join
      end
    end

    def comment_attribute_definition(attribute_name)
      # puts "Removing #{model}##{attribute_name} which is present in the model but not in the OpenAPI-specification"
      matched_trailing_comma = false
      @file_lines = file_lines.map do |line|
        matched = line.match(Regexp.new(":#{attribute_name},"))
        if matched || matched_trailing_comma
          line.insert(8, '# ')
          matched_trailing_comma = line.match(/,\n/)
          # puts line
        end
        line
      end
    end

    def add_attribute_definition(attribute_name)
      # puts "Adding #{model}##{attribute_name} which is present in the OpenAPI-specification but not in the model"
      attribute_definition = schema.fetch('properties')[attribute_name.to_s]

      if attribute_definition.key? 'type'
        type = if attribute_definition['type'].is_a?(Array)
                 attribute_definition['type'].reject { |t| t == 'null' }.first
               elsif attribute_definition['type'].is_a?(Hash)
                 attribute_definition['type']['type']
               else
                 attribute_definition['type']
               end
        class_name = nil
      elsif attribute_definition.key? '$ref'
        type = 'object'
        class_name = ref_to_class_name attribute_definition['$ref']
      elsif attribute_definition.key? 'oneOf'
        type = 'object'
        refs = attribute_definition['oneOf'].reject { |r| r['type'] == 'null' }
        class_name = if refs.count == 1
                      ref_to_class_name(refs.first['$ref'])
                     elsif refs.count > 1
                       "[#{refs.map { |ref| ref_to_class_name(ref['$ref']) }.join(', ')}]"
                     else
                       nil
                     end
      end

      line = "        attribute :#{attribute_name}, type: :#{type}, on: [:create, :read, :update]"
      if class_name.is_a?(String)
        line += ", class_name: #{class_name}"
      end
      line += "\n"
      after = file_lines.index { |line| line.match(/\s*attribute\s\:/) }
      # puts line
      file_lines.insert(after, line)
    end

    def ref_to_class_name(ref)
      class_name = Ioki::Support.camelize(ref.split('--').last.split('/').last)
      "'#{class_name}'"
    end

    def save!
      File.write(file_path, file_lines.join)
    end

    def unspecified_model_attributes
      defined_model_attributes - schema_attributes
    end

    def deprecated_model_attributes
      defined_model_attributes & deprecated_schema_attributes
    end

    def undefined_schema_attributes
      specified_schema_attributes - defined_model_attributes
    end

    def specified_schema_attributes
      schema.fetch('properties').reject do |_name, attributes|
        attributes['deprecated']
      end.keys.map(&:to_sym)
    end

    def deprecated_schema_attributes
      schema.fetch('properties').select do |_name, attributes|
        attributes['deprecated']
      end.keys.map(&:to_sym)
    end

    def schema_attributes
      schema.fetch('properties').keys.map(&:to_sym)
    end

    # Attributes present in the Ioki::Model class
    def defined_model_attributes
      ioki_model
        .attribute_definitions
        .reject { |_key, definition| definition[:unvalidated] }
        .keys
    end

    def schema
      specification.schemas[schema_path]
    end

    def schema_path
      ioki_model.schema_path || "#{specification.scope}--#{model_name}"
    end

    def file_lines
      @file_lines ||= model_file.readlines.to_a
    end

    def model_file
      File.open file_path
    end

    def file_path
      "lib/ioki/model/#{specification.name}/#{model_name}.rb"
    end

    def model_name
      Ioki::Support.underscore ioki_model.to_s.split('::').last
    end
  end

  class Specification
    attr_accessor :name, :scope

    def self.all
      [
        new('platform', 'platform_api--v20210101'),
        new('passenger', 'passenger_api'),
        new('driver', 'driver_api'),
        new('webhooks', 'webhooks--v20201201')
      ]
    end

    def initialize(name, scope)
      @name = name
      @scope = scope
    end

    def repair
      valid?

      models.each(&:repair)
    end

    def valid?
      raise "File not found: #{definition_file_path}" unless File.file?(definition_file_path)
    end

    def models
      @models ||= base_model.descendants.reject(&:unvalidated?).map do |model|
        Model.new(self, model)
      end
    end

    def base_model
      Ioki::Model.const_get(Ioki::Support.camelize(name)).const_get('Base')
    end

    def schemas
      definition_json.dig('components', 'schemas')
    end

    def definition_json
      JSON.parse(File.read(definition_file_path))
    end

    def file_exists?
      File.file?(definition_file_path)
    end

    def definition_file_path
      "spec/fixtures/open_api_definitions/#{name}_api.json"
    end
  end
end
