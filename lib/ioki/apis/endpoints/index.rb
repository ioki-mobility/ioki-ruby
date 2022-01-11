# frozen_string_literal: true

module Endpoints
  class Index
    attr_reader :model_class, :base_path, :resource, :path

    def initialize(resource, base_path:, model_class:, path: nil)
      @base_path = base_path
      @resource = resource.to_s
      @model_class = model_class
      @path = path
    end

    def name
      resource.to_s
    end

    def resource_path_name
      path || resource
    end

    def full_path
      base_path + [resource_path_name]
    end

    def call(client, args = [], options = {}, &block)
      auto_paginate = options.delete(:auto_paginate)

      if auto_paginate
        paginated_requests(client, args, options, &block)
      elsif block_given?
        send_request(client, args, options).first.each { |item| block.call(item) }
      else
        send_request(client, args, options).first
      end
    end

    private

    def paginated_requests(client, args, options, &block)
      # Accumulates request results or yields them to given block while iterating over pages.

      results = []
      current_page = 1

      loop do
        options[:params] ||= {}
        options[:params][:page] = current_page

        page_results, parsed_response = send_request(client, args, options)
        if block_given?
          page_results.each { |item| block.call(item) }
        else
          results += page_results
        end
        current_page += 1

        break results unless parsed_response.dig('meta', 'last_page') == false
      end
    end

    def send_request(client, args, options)
      parsed_response, = client.request(
        url:    client.build_request_url(*Endpoints.url_elements(full_path, *args)),
        params: options[:params]
      )

      [parsed_response['data'].map { |attr| model_class.new(attr) }, parsed_response]
    end
  end
end
