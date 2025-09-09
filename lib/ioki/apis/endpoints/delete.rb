# frozen_string_literal: true

module Ioki
  module Endpoints
    class Delete
      attr_reader :base_path, :model_class, :resource, :path, :with_id

      def initialize(resource, base_path:, model_class:, outgoing_model_class: nil, path: nil, with_id: true)
        @base_path = base_path
        @resource = resource.to_s
        @model_class = model_class
        @outgoing_model_class = outgoing_model_class
        @path = path
        @with_id = with_id
      end

      def name
        "delete_#{resource}"
      end

      def resource_path_name
        path || resource.pluralize
      end

      def full_path
        path_elements = base_path + [resource_path_name]
        with_id ? path_elements + [:id] : path_elements
      end

      def call(client, args = [], options = {})
        # outgoing_model_class = @outgoing_model_class || options[:outgoing_model_class] || model_class

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
