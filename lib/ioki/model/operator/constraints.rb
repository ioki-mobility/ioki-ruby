# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Constraints < Base
        unvalidated true

        attribute :max_passengers, on: :read, type: :integer
        attribute :max_wheelchairs, on: :read, type: :integer
        attribute :max_walkers, on: :read, type: :integer
        attribute :max_storage_spaces, on: :read, type: :integer
        attribute :area, on: :read, type: :object, class_name: 'Area'
      end
    end
  end
end
