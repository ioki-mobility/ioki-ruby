# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Availability < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :id, :type, :created_at and :updated_at.

        unvalidated true # No specification available

        attribute :available, on: :read, type: :boolean
        attribute :next_availability, on: :read, type: :date_time
      end
    end
  end
end
