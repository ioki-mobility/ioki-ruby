# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ProductValidation < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :severity, on: :read, type: :string
        attribute :title, on: :read, type: :string
        attribute :description, on: :read, type: :string
      end
    end
  end
end
