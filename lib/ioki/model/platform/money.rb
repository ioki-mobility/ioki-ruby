# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Money < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at and :id.

        def self.schema_path
          'money'
        end

        attribute :amount, on: :read, type: :integer
        attribute :currency, on: :read, type: :string
        attribute :type, on: :read, type: :string
        attribute :vat_rate, on: :read, type: :float
      end
    end
  end
end
