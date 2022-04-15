# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Station < Base
        attribute :active, on: :read, type: :boolean
        attribute :city,          on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :country,       on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :county,        on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :deactivations, on: :read, type: :array, class_name: 'Deactivation'
        attribute :description,   on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :external_id,   on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :lat,           on: [:read, :create, :update], type: :float
        attribute :lng,           on: [:read, :create, :update], type: :float
        attribute :location_name, on: [:read, :create, :update], type: :string
        attribute :postal_code,   on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :station_type,  on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :street_name,   on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
        attribute :street_number, on: [:read, :create, :update], omit_if_blank_on: [:create, :update], type: :string
      end
    end
  end
end
