# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Cancellation < Ioki::Model::Base

        unvalidated true # Specification not available. Only used for creation.

        attribute :ride_version,                   on: :create, type: :integer
        attribute :code,                           on: :create, type: :string
        attribute :cancellation_statement_id,      on: :create, type: :string
      end
    end
  end
end
