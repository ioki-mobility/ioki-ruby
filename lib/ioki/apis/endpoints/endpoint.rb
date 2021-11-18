# frozen_string_literal: true

module Endpoints
  class Endpoint
    attr_reader :resource, :action, :request_method, :path, :model_class

    def initialize(resource, action:, request_method:, path:, model_class: nil)
      @resource = resource
      @action = action
      @request_method = request_method
      @path = path
      @model_class = model_class
    end

    def name
      "#{resource}_#{action}"
    end

    def call(client, args = [], options = {})
      parsed_response, = client.request(
        url:    client.build_request_url(*Endpoints.url_elements(resource, path + [action], *args)),
        method: request_method,
        body:   options[:body],
        params: options[:params]
      )

      if model_class
        model_class.new(parsed_response['data'])
      else
        parsed_response
      end
    end
  end
end
