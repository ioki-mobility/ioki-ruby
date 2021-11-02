# frozen_string_literal: true

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
        url:     client.build_request_url(*Endpoints.url_elements(name, full_path, *args)),
        method:  :delete,
        headers: client.all_headers,
        params:  options[:params]
      )

      model_class.new(parsed_response['data'])
    end
  end
end
