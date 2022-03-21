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
        camelize data['type']
      end

      def action
        event_type&.split('.')&.last
      end

      private

      def camelize(term)
        string = term.to_s.sub(/^[a-z\d]*/) { |match| match.capitalize! || match }
        string.gsub!(%r{(?:_|(/))([a-z\d]*)}i) do
          word = Regexp.last_match(2)
          substituted = word.capitalize! || word
          Regexp.last_match(1) ? "::#{substituted}" : substituted
        end
        string
      end

    end
  end
end
