# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PassengerType < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :id, :type, :created_at and :updated_at.

        unvalidated true # Specification not available.

        attribute :type, on: :read, type: :string
      end
    end
  end
end