# frozen_string_literal: true

module Ioki
  module Endpoints
    module Passenger
      class UpdateLanguage
        def name
          'update_language'
        end

        def call(client, args = [], options = {})
          client.config.language = args.last
          client.config.http_adapter = Ioki::HttpAdapter.get(client.config) unless client.config.custom_http_adapter
          client.request(
            url:    client.build_request_url('passenger', 'user', 'language'),
            method: :patch,
            params: options[:params]
          )
        end
      end
    end
  end
end
