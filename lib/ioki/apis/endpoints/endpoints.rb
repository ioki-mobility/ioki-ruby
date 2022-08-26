# frozen_string_literal: true

require_relative 'endpoint'
require_relative 'create'
require_relative 'show'
require_relative 'show_singular'
require_relative 'index'
require_relative 'update'
require_relative 'update_singular'
require_relative 'delete'

module Ioki
  module Endpoints
    def self.custom_endpoints(resource, actions:, path:, model_class:)
      actions.map do |action, request_method|
        Endpoint.new(resource, action: action, request_method: request_method, path: path, model_class: model_class)
      end
    end

    def self.crud_endpoints(resource, model_class:, base_path:, paths: {}, except: nil)
      plural = "#{resource}s"
      singular = resource.to_s

      [Index, Show, Create, Update, Delete].map do |type|
        # In some cases endpoints are not consistently using singular and plural for the same type of endpoints. In that
        # case or similar ones an endpoints path can be forced. The logic here allows to express this for
        # `crud_endpoints`.
        # Example:
        # Endpoints.crud_endpoints(
        #  :rating,
        #  base_path: ['ratings'],
        #  paths: {create: 'rating', update: 'rating', delete: 'rating'}
        # ...

        type_key = type.to_s.split('::').last.downcase.to_sym
        name = [Index].include?(type) ? plural : singular

        unless except&.include?(type.class.to_s.downcase)
          type.new(name, model_class: model_class, base_path: base_path, path: paths[type_key])
        end
      end
    end

    def self.url_elements(path, *args)
      unless path.all? { |element| [Symbol, String].include?(element.class) }
        raise ArgumentError, 'path: must consist of Strings and Symbols only'
      end

      unless path.select { |element| element.is_a?(Symbol) }.size <= args.size
        raise ArgumentError, "args: must have an argument for every symbol in :path. path: #{path}, args: #{args}"
      end

      interpolation_args = path.select { |inner_element| inner_element.is_a?(Symbol) }.zip(args).reverse
      interpolation_path = path.map { |element| element.is_a?(String) ? element : interpolation_args.pop }
      interpolation_path.map do |path_element, arg|
        next path_element if path_element.is_a?(String)
        next arg if arg.is_a?(String)

        arg.public_send(path_element)
      end.compact
    end
  end
end
