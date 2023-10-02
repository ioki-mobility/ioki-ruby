# frozen_string_literal: true

namespace :ioki do
  namespace :openapi do
    desc 'Remove unspecified and add missing attributes from OpenAPI specification'
    task :fix do
      require 'ioki'
      require 'json'
      require 'debug'

      @api_specification_paths = {
        platform_api:  'spec/fixtures/open_api_definitions/platform_api.json',
        passenger_api: 'spec/fixtures/open_api_definitions/passenger_api.json',
        driver_api:    'spec/fixtures/open_api_definitions/driver_api.json',
        webhooks_api:  'spec/fixtures/open_api_definitions/webhooks_api.json'
      }

      @api_specifications = @api_specification_paths.transform_values do |path|
        File.file?(path) ? JSON.parse(File.read(path)) : nil
      end

      def underscore(camel_cased_word)
        camel_cased_word
          .to_s
          .gsub('::', '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
      end

      def camelize(word)
        word
          .to_s
          .gsub(/\/(.?)/) { "::#{Regexp.last_match(1).upcase}" }
          .gsub(/(?:^|_)(.)/) { Regexp.last_match(1).upcase }
      end

      def schemas
        @api_specifications.fetch((@api + '_api').to_sym).fetch('components').fetch('schemas')
      end

      def model_name
        underscore @model.to_s.split('::').last
      end

      def file_path
        "lib/ioki/model/#{@api}/#{model_name}.rb"
      end

      def model_file
        File.open file_path
      end

      def model_file_lines
        model_file.readlines.to_a
      end

      def schema_path
        @model.schema_path || "#{@model.specification_scope}--#{model_name}"
      end

      def model_node
        schemas[schema_path]
      end

      def model_properties
        raise "Unknown schema_path: #{schema_path}" if schemas[schema_path].nil?

        model_node.fetch('properties')
      end

      def specified_attributes
        model_properties.keys.map(&:to_sym) -
          unvalidated_attributes -
          deprecated_attributes
      end

      def deprecated_attributes
        model_node.fetch('properties').select do |_name, attributes|
          attributes['deprecated']
        end.keys.map(&:to_sym)
      end

      def defined_attributes
        @model.attribute_definitions.keys - unvalidated_attributes
      end

      def unvalidated_attributes
        @model
          .attribute_definitions
          .select { |_key, definition| definition[:unvalidated] }
          .keys
      end

      def add_attribute_line(name:, type:, class_name:)
        after = @lines.index { |line| line.match(/\s*attribute\s\:/) }
        line = "        attribute :#{name}, type: :#{type}, on: [:create, :read, :update]"
        if class_name
          line += ", class_name: '#{class_name}'"
        end
        line += "\n"
        puts line
        @lines.insert(after, line)
      end

      {
        platform: Ioki::Model::Platform::Base,
        passenger: Ioki::Model::Passenger::Base,
        driver: Ioki::Model::Driver::Base,
        webhooks: Ioki::Model::Webhooks::Base
      }.each do |api, base_model|
        @api = api.to_s
        base_model.descendants.reject(&:unvalidated?).each do |model|
          puts model
          @model = model
          @lines = model_file_lines
          changed = false
          (defined_attributes - specified_attributes).each do |unspecified_attribute|
            puts "Removing #{model}##{unspecified_attribute} which is not present in OpenAPI-specification"
            @model.attribute_definitions
            matched_trailing_comma = false
            @lines = @lines.map do |line|
              matched = line.match(Regexp.new(":#{unspecified_attribute},"))
              if matched || matched_trailing_comma
                line.insert(8, '# ')
                matched_trailing_comma = line.match(/,\n/)
              end
              line
            end
            changed = true
          end

          (specified_attributes - defined_attributes).each do |undefined_attribute|
            puts "OpenAPI-specification attribute which is missing from #{model}: #{undefined_attribute}"
            attribute_definition = model_properties[undefined_attribute.to_s]
            if attribute_definition.key? 'type'
              type = if attribute_definition['type'].is_a?(Array)
                       attribute_definition['type'].reject { |t| t == 'null' }.first
                     else
                       attribute_definition['type']
                     end
              class_name = nil
            elsif attribute_definition.key? 'oneOf'
              type = 'object'
              refs = attribute_definition['oneOf'].reject { |r| r['type'] == 'null' }
              class_name = if refs.count == 1
                             camelize(refs.first['$ref'].split('--').last.split('/').last)
                           else
                             nil
                           end
            end
            add_attribute_line name: undefined_attribute, type: type, class_name: class_name
            changed = true
          end

          File.write(file_path, @lines.join) if changed
        end
      end
    end
  end
end
