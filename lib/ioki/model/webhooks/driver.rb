# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Driver < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :first_name, type: :string
        attribute :last_name, type: :string
        attribute :phone_number, type: :string
        attribute :product_id, type: :string
        attribute :username, type: :string
        attribute :connected_vehicle, type: :object, class_name: 'NestedVehicle'
      end
    end
  end
end
