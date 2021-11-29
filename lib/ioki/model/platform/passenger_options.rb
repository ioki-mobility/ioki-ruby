# frozen_string_literal: true

require 'ioki/model/platform/passenger_type'

module Ioki
  module Model
    module Platform
      class PassengerOptions < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :type, :id, :created_at and :updated_at.

        unvalidated true # Specification not available.

        attribute :types, on: :read, type: :array, model_class: PassengerType
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