# frozen_string_literal: true

module Ioki
  module Endpoints
    class DeleteSingular < Delete
      def full_path
        base_path + [resource_path_name]
      end

      def call(client, args = [], options = {})
        parsed_response, = client.request(
          url:    client.build_request_url(*Endpoints.url_elements(full_path, *args)),
          method: :delete,
          body:   options[:body],
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
