# frozen_string_literal: true

module Ioki
  module Endpoints
    class Update
      attr_reader :base_path, :model_class, :resource, :path

      def initialize(resource, base_path:, model_class:, outgoing_model_class: nil, path: nil)
        @base_path = base_path
        @path = path
        @resource = resource.to_s
        @model_class = model_class
        @outgoing_model_class = outgoing_model_class
      end

      def name
        "update_#{resource}"
      end

      def resource_path_name
        path || "#{resource}s"
      end

      def full_path
        base_path + [resource_path_name, :id]
      end

      def call(client, model, args = [], options = {})
        outgoing_model_class = @outgoing_model_class || options[:outgoing_model_class] || model_class

        unless model.is_a?(outgoing_model_class)
          raise(ArgumentError, "#{model} is not an instance of #{outgoing_model_class}")
        end

        parsed_response, response = client.request(
          url:    client.build_request_url(*Endpoints.url_elements(full_path, *args)),
          method: :patch,
          body:   { data: model.serialize(:update) },
          params: options[:params]
        )

        return if parsed_response.nil?

        model_class.new(parsed_response['data'], response.headers[:etag], show_deprecation_warnings: false)
      end
    end
  end
end
