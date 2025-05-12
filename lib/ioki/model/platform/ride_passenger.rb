# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class RidePassenger < Base
        attribute :type,                    type: :string, on: [:create, :update]
        deprecated_attribute :bahncard,                type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
        deprecated_attribute :blue_badge,              type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
        deprecated_attribute :public_transport_ticket, type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
        deprecated_attribute :walker,                  type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
        deprecated_attribute :wheelchair,              type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
        attribute :options, on: [:read, :create], type: :array, class_name: 'PassengerOption'
      end
    end
  end
end
