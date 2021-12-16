# frozen_string_literal: true

require 'ioki/model/platform/area'

module Ioki
  module Model
    module Platform
      class Constraints < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at, :type and
        # :id.

        unvalidated true

        attribute :max_passengers, on: :read, type: :integer
        attribute :max_wheelchairs, on: :read, type: :integer
        attribute :max_walkers, on: :read, type: :integer
        attribute :max_storage_spaces, on: :read, type: :integer
        attribute :area, on: :read, type: :object, model_class: Area
      end
    end
  end
end
