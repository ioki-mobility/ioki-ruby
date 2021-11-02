# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Station < Base
        attribute :location_name, on: [:read, :update, :create], type: :string
        attribute :lat,           on: [:read, :update, :create], type: :float
        attribute :lng,           on: [:read, :update, :create], type: :float

        attribute :city,          on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :country,       on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :county,        on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :description,   on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :postal_code,   on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :street_name,   on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
        attribute :street_number, on: [:read, :update, :create], omit_if_blank_on: [:create, :update], type: :string
      end
    end
  end
end
