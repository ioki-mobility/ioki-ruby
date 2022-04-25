# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class PassengerOptions < Base
        unvalidated true # Specification not available.

        attribute :types, on: :read, type: :array, class_name: 'PassengerType'
        attribute :wheelchair, on: :read, type: :boolean
        attribute :walker, on: :read, type: :boolean
        attribute :public_transport_ticket, on: :read, type: :boolean
        attribute :bahncard, on: :read, type: :boolean
        attribute :blue_badge, on: :read, type: :boolean
        attribute :name_required_if_no_public_transport_ticket, on: :read, type: :boolean
      end
    end
  end
end
