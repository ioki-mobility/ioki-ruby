# frozen_string_literal: true

module Ioki
  module Endpoints
    class Create
      attr_reader :base_path, :model_class, :resource, :path

      def initialize(resource, base_path:, model_class:, outgoing_model_class: nil, path: nil, method_name: nil)
        @base_path = base_path
        @path = path
        @resource = resource.to_s
        @model_class = model_class
        @outgoing_model_class = outgoing_model_class
        @method_name = method_name
      end

      def name
        @method_name || "create_#{resource}"
      end

      def resource_path_name
        path || "#{resource}s"
      end

      def full_path
        (base_path + [resource_path_name]).flatten
      end

      def call(client, model, args = [], options = {})
        outgoing_model_class = @outgoing_model_class || options[:outgoing_model_class] || model_class

        unless model.is_a?(outgoing_model_class)
          raise(ArgumentError, "#{model} is not an instance of #{outgoing_model_class}")
        end

        parsed_response, response = client.request(
          url:    client.build_request_url(*Endpoints.url_elements(full_path, *args)),
          method: :post,
          body:   { data: model.serialize(:create) },
          params: options[:params]
        )

        return if parsed_response.nil?

        model_class
          .new(parsed_response['data'], response.headers[:etag], show_deprecation_warnings: false)
          .tap(&:clear_changes_information)
      end
    end
  end
end
