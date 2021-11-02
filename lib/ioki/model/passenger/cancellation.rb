# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Cancellation < Base
        attribute :ride_id,                        on: [:create, :read], type: :string
        attribute :ride_version,                   on: [:create, :read], type: :integer
        attribute :code,                           on: [:create, :read], type: :string
        attribute :passenger_cancellation_reason,  on: [:create, :read], type: :string
        # attribute :cancellation_statement_id, type: :string
      end
    end
  end
end
