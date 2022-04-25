# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Client < Base
        attribute :type, on: :read, type: :string
        attribute :allows_external_payment, on: :read, type: :boolean
        attribute :current_version, on: :read, type: :string
        attribute :identifier, on: :read, type: :string
        attribute :min_version, on: :read, type: :string
        attribute :name, on: :read, type: :string
      end
    end
  end
end
