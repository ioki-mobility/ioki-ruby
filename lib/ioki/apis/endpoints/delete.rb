# frozen_string_literal: true

module Ioki
  module Endpoints
    class Delete
      attr_reader :base_path, :model_class, :resource, :path

      def initialize(resource, base_path:, model_class:, path: nil)
        @base_path = base_path
        @resource = resource.to_s
        @model_class = model_class
        @path = path
      end

      def name
        "delete_#{resource}"
      end

      def resource_path_name
        path || "#{resource}s"
      end

      def full_path
        base_path + [resource_path_name, :id]
      end

      def call(client, args = [], options = {})
        parsed_response, = client.request(
          url:    client.build_request_url(*Endpoints.url_elements(full_path, *args)),
          method: :delete,
          params: options[:params]
        )

        return if parsed_response.nil?

        model_class
          .new(parsed_response['data'], nil, show_deprecation_warnings: false)
          .tap(&:clear_changes_information)
      end
    end
  end
end
