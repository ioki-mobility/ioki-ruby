# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Route < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at and :id.

        unvalidated true # No specification available

        attribute :track, type: :string, on: :read
      end
    end
  end
end
