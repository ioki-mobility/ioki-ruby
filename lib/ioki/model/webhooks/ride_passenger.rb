# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class RidePassenger < Base
        attribute :bahncard, type: :boolean
        attribute :blue_badge, type: :boolean
        attribute :public_transport_ticket, type: :boolean
        attribute :type, type: :string
        attribute :walker, type: :boolean
        attribute :wheelchair, type: :boolean
      end
    end
  end
end
