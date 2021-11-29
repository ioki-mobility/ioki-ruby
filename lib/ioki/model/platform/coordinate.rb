# frozen_string_literal: true

require 'ioki/model/platform/coordinate'

module Ioki
  module Model
    module Platform
      class Coordinate < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :created_at, :id, :type and :updated_at.
        unvalidated true # No specification available.

        attribute :lat, on: :read, type: :float
        attribute :lng, on: :read, type: :float
      end
    end
  end
end