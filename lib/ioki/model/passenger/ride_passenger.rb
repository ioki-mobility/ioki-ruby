# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class RidePassenger < Ioki::Model::Base
        # Note that this does not inherit from Base because :type behaves differently here.

        def self.specification_scope
          'passenger_api'
        end

        attribute :type, on: [:create, :update], type: :string
        attribute :bahncard, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        attribute :blue_badge, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        attribute :public_transport_ticket, on: [:read, :create, :update], omit_if_blank_on: [:create, :update],
type: :boolean
        attribute :walker, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        attribute :wheelchair, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        attribute :first_name, on: :read, type: :string
        attribute :last_name, on: :read, type: :string
      end
    end
  end
end
