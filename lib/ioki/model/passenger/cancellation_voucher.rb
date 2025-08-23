# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class CancellationVoucher < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        # attribute :ride_version, on: :create, type: :integer
        attribute :code, on: :read, type: :string
        attribute :valid_until, on: :read, type: :date_time
        attribute :fee, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
