# frozen_string_literal: true

namespace :ioki do
  namespace :openapi do
    require 'yaml'
    require 'open_api'
    desc 'List all errors in a friendly format'
    task :list do
      errors = 0
      result = {}
      OpenApi::Specification.all.each do |specification|
        specification.models.each do |model|
          error_hash = {}
          if model.schema
            if model.unspecified_model_attributes.any?
              error_hash['unspecified_model_attributes'] = model.unspecified_model_attributes.map(&:to_s)
              errors += model.unspecified_model_attributes.count
            end
            if model.deprecated_model_attributes.any?
              error_hash['deprecated_model_attributes'] = model.deprecated_model_attributes.map(&:to_s)
              errors += model.deprecated_model_attributes.count
            end
            if model.undefined_schema_attributes.any?
              error_hash['undefined_schema_attributes'] = model.undefined_schema_attributes.map(&:to_s)
              errors += model.undefined_schema_attributes.count
            end
          else
            errors += 1
            error_hash['unknown_schema'] = model.schema_path
          end
          result[model.ioki_model.to_s] = error_hash unless error_hash.empty?
        end
      end
      puts YAML.dump(result)
      puts "Errors: #{errors}"
    end

    desc 'Remove unspecified and add missing attributes from OpenAPI specification'
    task :repair do
      OpenApi::Specification.all.map(&:repair)
    end
  end
end
