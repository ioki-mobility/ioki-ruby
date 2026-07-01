# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module VehicleStates
        class Vehicle < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :id,
                    on:   :read,
                    type: :string

          attribute :created_at,
                    on:   :read,
                    type: :date_time

          attribute :updated_at,
                    on:   :read,
                    type: :date_time

          attribute :autonomous,
                    on:   :read,
                    type: :boolean

          attribute :description,
                    on:   :read,
                    type: :string

          attribute :external_id,
                    on:   :read,
                    type: :string

          attribute :fuel_type,
                    on:   :read,
                    type: :string

          attribute :license_plate,
                    on:   :read,
                    type: :string

          attribute :manufacturer,
                    on:   :read,
                    type: :string

          attribute :matching_rank,
                    on:   :read,
                    type: :integer

          attribute :model,
                    on:   :read,
                    type: :string

          attribute :nickname,
                    on:   :read,
                    type: :string

          attribute :phone_number,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
