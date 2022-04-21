# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class RidePassenger < Base
        attribute :bahncard, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        attribute :blue_badge, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        attribute :first_name, on: :read, type: :string
        attribute :last_name, on: :read, type: :string
        attribute :public_transport_ticket,
                  on:               [:read, :create, :update],
                  omit_if_blank_on: [:create, :update],
                  type:             :boolean
        attribute :type, on: [:create, :update], type: :string
        attribute :walker, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        attribute :wheelchair, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
      end
    end
  end
end
