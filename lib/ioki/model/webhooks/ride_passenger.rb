# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class RidePassenger < Base
        attribute :options, type: :array, on: [:create, :read, :update]
        deprecated_attribute :bahncard, type: :boolean
        deprecated_attribute :blue_badge, type: :boolean
        deprecated_attribute :public_transport_ticket, type: :boolean
        attribute :type, type: :string
        deprecated_attribute :walker, type: :boolean
        deprecated_attribute :wheelchair, type: :boolean
      end
    end
  end
end
