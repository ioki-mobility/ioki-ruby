# frozen_string_literal: true

module Ioki
  module Endpoints
    class DeleteSingular < Delete
      def full_path
        base_path + [resource_path_name]
      end

      def call(client, model, args = [], options = {})
        outgoing_model_class = @outgoing_model_class || options[:outgoing_model_class] || model_class

        unless model.is_a?(outgoing_model_class)
          raise(ArgumentError, "#{model} is not an instance of #{outgoing_model_class}")
        end

        parsed_response, = client.request(
          url:    client.build_request_url(*Endpoints.url_elements(full_path, *args)),
          method: :delete,
          body:   { data: model.serialize(:delete) },
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
