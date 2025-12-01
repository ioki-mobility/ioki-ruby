# frozen_string_literal: true

module Ioki
  module Endpoints
    class Delete
      attr_reader :base_path, :model_class, :resource, :path

      def initialize(resource, base_path:, model_class:, **options)
        @base_path = base_path
        @resource = resource.to_s
        @model_class = model_class
        @outgoing_model_class = options[:outgoing_model_class]
        @path = options[:path]
        @send_body = options.fetch(:send_body, false)
      end

      def name
        "delete_#{resource}"
      end

      def resource_path_name
        path || resource.pluralize
      end

      def full_path
        base_path + [resource_path_name, :id]
      end

      def call(client, model, args = [], options = {})
        outgoing_model_class = @outgoing_model_class || options[:outgoing_model_class] || model_class

        unless model.nil? || model.is_a?(outgoing_model_class)
          raise(ArgumentError, "#{model} is not an instance of #{outgoing_model_class}")
        end

        body = @send_body && model ? { data: model.serialize(:delete) } : nil

        parsed_response, = client.request(
          url:    client.build_request_url(*Endpoints.url_elements(full_path, *args)),
          method: :delete,
          body:,
          params: options[:params]
        )

        return if parsed_response.nil? || model_class.nil?

        model_class
          .new(parsed_response['data'], nil, show_deprecation_warnings: false)
          .tap(&:clear_changes_information)
      end
    end
  end
end
