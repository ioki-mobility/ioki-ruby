# frozen_string_literal: true

module Ioki
  module Webhooks
    class Event
      attr_reader :id, :event_type, :provider_id, :created_at, :api_version, :data

      def initialize(params)
        @id          = params['id']
        @event_type  = params['event_type']
        @provider_id = params['provider_id']
        @created_at  = params['created_at']
        @api_version = params['api_version']
        @data        = params['data']
      end

      def model
        model_class.new(data, nil, show_deprecation_warnings: false)
      end

      def model_class
        Ioki::Model::Webhooks.const_get model_class_name
      end

      def model_class_name
        Ioki::Support.camelize data['type']
      end

      def action
        event_type&.split('.')&.last
      end

    end
  end
end
