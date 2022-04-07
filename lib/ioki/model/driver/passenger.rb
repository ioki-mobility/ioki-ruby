# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Passenger < Base
        unvalidated true # Specification not available.

        attribute :type, on: :create, type: :string
        attribute :wheelchair, on: :create, type: :boolean
        attribute :walker, on: :create, type: :boolean
        attribute :public_transport_ticket, on: :create, type: :boolean
        attribute :bahncard, on: :create, type: :boolean
        attribute :blue_badge, on: :create, type: :boolean
        attribute :first_name, on: :create, type: :string
        attribute :last_name, on: :create, type: :string
      end
    end
  end
end
