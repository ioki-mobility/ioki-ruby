# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class RidePassenger < Base
        deprecated_attribute :bahncard, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        deprecated_attribute :blue_badge, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        attribute :first_name, on: :read, type: :string
        attribute :last_name, on: :read, type: :string
        deprecated_attribute :public_transport_ticket,
                             on:               [:read, :create, :update],
                             omit_if_blank_on: [:create, :update],
                             type:             :boolean
        attribute :type, on: [:create, :update], type: :string
        deprecated_attribute :walker, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        deprecated_attribute :wheelchair, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :boolean
        attribute :options, on: [:read, :create], type: :array, class_name: 'PassengerOption', omit_if_blank_on: :create
      end
    end
  end
end
