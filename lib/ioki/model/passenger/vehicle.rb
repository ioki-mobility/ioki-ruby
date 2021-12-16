# frozen_string_literal: true

require 'ioki/model/passenger/image_upload'

module Ioki
  module Model
    module Passenger
      class Vehicle < Base
        attribute :fuel_type, on: :read, type: :string
        attribute :license_plate, on: :read, type: :string
        attribute :manufacturer, on: :read, type: :string
        attribute :model, on: :read, type: :string
        attribute :nickname, on: :read, type: :string
        attribute :seats, on: :read, type: :integer
        attribute :storage_spaces, on: :read, type: :integer
        attribute :walker_bays, on: :read, type: :integer
        attribute :wheelchair_bays, on: :read, type: :integer
        attribute :avatar, on: :read, type: :object, model_class: ImageUpload
        attribute :operator_information, on: :read, type: :string
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
