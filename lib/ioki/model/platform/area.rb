# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Area < Ioki::Model::Base
        # Note that this does not inherit from Ioki::Model::Platform::Base because :type behaves differently here.

        unvalidated true

        attribute :coordinates, type: :array, on: :read
        attribute :type, type: :string, on: :read
      end
    end
  end
end
