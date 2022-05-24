# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Permission < Base
        attribute :type, on: :read, type: :string
        attribute :identifier, on: :read, type: :string
        attribute :resource_id, on: :read, type: :string
        attribute :resource_type, on: :read, type: :string
      end
    end
  end
end
