# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class RidePassenger < Ioki::Model::Base
        # Note that this does not inherit from Ioki::Model::Platform::Base because :type behaves differently here.

        attribute :type,                    type: :string, on: [:create, :update]
        attribute :bahncard,                type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
        attribute :blue_badge,              type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
        attribute :public_transport_ticket, type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
        attribute :walker,                  type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
        attribute :wheelchair,              type: :boolean, on: [:create, :update], omit_if_blank_on: [:create, :update]
      end
    end
  end
end
