# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PrebookingThreshold < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :id, :type, :created_at and :updated_at.

        unvalidated true # Specification not available.

        attribute :min, on: :read, type: :integer
        attribute :max, on: :read, type: :integer
      end
    end
  end
end
