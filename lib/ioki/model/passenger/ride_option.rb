# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class RideOption < Base
        attribute :name, on: [:read, :create], type: :string
        attribute :value, on: :create, type: [:string, :boolean, :integer]

        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time

        attribute :bookable, on: :read, type: :boolean
        attribute :data_type, on: :read, type: :string
        attribute :option_type, on: :read, type: :string
        attribute :localized_accessibility_information, on: :read, type: :string
        attribute :localized_description, on: :read, type: :string
        attribute :localized_info, on: :read, type: :string
        attribute :localized_link, on: :read, type: :string
        attribute :localized_link_text, on: :read, type: :string
        attribute :localized_name, on: :read, type: :string
      end
    end
  end
end
