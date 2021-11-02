# frozen_string_literal: true

require_relative 'endpoint'
require_relative 'create'
require_relative 'show'
require_relative 'show_singular'
require_relative 'index'
require_relative 'update'
require_relative 'update_language'
require_relative 'delete'

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

  def self.url_elements(resource, path, *args)
    args_min = path.select { |el| el.is_a?(Symbol) }.size

    unless path.all? { |element| element.is_a?(String) || element.is_a?(Symbol) }
      raise ArgumentError, 'path: must consist of Strings and Symbols'
    end

    if args.size < args_min
      raise ArgumentError,
            "\#'#{resource}' needs at least #{args_min} arguments, but I only got #{args.size}."
    end

    arg_idx = 0
    path.map do |el|
      next el unless el.is_a?(Symbol)

      arg = args[arg_idx]
      arg_idx += 1

      unless arg.is_a?(String) || arg.respond_to?(el)
        raise ArgumentError,
              "\#'#{resource}': argument #{arg_idx} must respond to :#{el} or to be a string"
      end

      arg.is_a?(String) ? arg : arg.public_send(el)
    end.compact
  end
end
