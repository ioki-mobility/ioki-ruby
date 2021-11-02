# frozen_string_literal: true

module Endpoints
  class UpdateLanguage
    def name
      'update_language'
    end

    def call(client, args = [], options = {})
      client.config.language = args.last
      client.request(
        url:     URI("#{client.config.api_base_url}/passenger/user/language"),
        headers: client.all_headers,
        method:  :patch,
        params:  options[:params]
      )
    end
  end
end
