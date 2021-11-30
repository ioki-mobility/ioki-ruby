# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class MinimumAgeConfirmation < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :id, :type, :created_at and :updated_at.

        unvalidated true # No specification available.

        attribute :minimum_age, on: :read, type: :integer
      end
    end
  end
end
