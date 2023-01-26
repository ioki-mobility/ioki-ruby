# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Money < Base
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
