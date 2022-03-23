# frozen_string_literal: true

require 'ostruct'

module Ioki
  module Webhooks
    class Event < OpenStruct

      def model
        model_class.new data
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
