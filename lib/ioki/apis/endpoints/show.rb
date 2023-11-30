# frozen_string_literal: true

module Ioki
  module Endpoints
    class Show
      attr_reader :base_path, :model_class, :resource, :path

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
        path || "#{resource}s"
      end

      def full_path
        base_path + [resource_path_name, :id]
      end

      def call(client, args = [], options = {})
        # :show can optionally use the model for caching.
        model = options[:model] if options[:model].is_a?(model_class)
        attributes, etag = model_params(client, args, options, model)

        model_class.new(attributes, etag, show_deprecation_warnings: false)
      end

      private

      def model_params(client, args, options, model)
        parsed_response, response = client.request(
          url:     client.build_request_url(*Endpoints.url_elements(full_path, *args)),
          headers: { 'If-None-Match': model&._etag },
          params:  options[:params]
        )

        [parsed_response['data'], response.headers[:etag]]
      rescue Ioki::Error::NotModified
        [model.attributes, model._etag]
      end
    end
  end
end
