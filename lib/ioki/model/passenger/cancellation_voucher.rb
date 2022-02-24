# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class CancellationVoucher < Base
        def self.specification_scope
          'passenger_api'
        end

        attribute :ride_version, on: :create, type: :integer

        attribute :code, on: :read, type: :string
        attribute :valid_until, on: :read, type: :date_time
        attribute :fee, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
