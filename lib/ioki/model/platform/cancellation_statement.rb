# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class CancellationStatement < Base
        attribute :group, on: :read, type: :string
        attribute :identifier, on: :read, type: :string
        attribute :product_id, on: :read, type: :string
        attribute :title, on: :read, type: :string
      end
    end
  end
end
