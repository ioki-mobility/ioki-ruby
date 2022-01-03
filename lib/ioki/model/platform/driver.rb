# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Driver < Base
        attribute :connected_vehicle_id, on: :read, type: :string
        attribute :external_id, on: [:create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :locked_at, on: :read, type: :date_time
        attribute :username, on: [:create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :first_name, on: [:create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :last_name, on: [:create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :display_name, on: :read, type: :string
        attribute :locale, on: :create, omit_if_blank_on: :create, type: :string
        attribute :phone_number, on: :create, omit_if_blank_on: :create, type: :string
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
