# frozen_string_literal: true

module Endpoints
  module Driver
    class ConfirmFirebasePush
      def name
        'confirm_firebase_push'
      end

      def path
        ['driver', 'firebase_debug_records', :id, 'confirm']
      end

      def call(client, args, body)
        client.request(
          url:    client.build_request_url(*Endpoints.url_elements(path, *args)),
          method: :post,
          body:   body
        )
      end
    end
  end
end
