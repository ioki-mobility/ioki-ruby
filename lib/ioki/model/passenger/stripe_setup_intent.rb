# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class StripeSetupIntent < Base
        def self.schema_path
          'passenger_api--v1--stripe--setup_intent'
        end

        attribute :id, on: :read, type: :string
        attribute :client_secret, on: :read, type: :string
        attribute :type, on: :read, type: :string
      end
    end
  end
end
