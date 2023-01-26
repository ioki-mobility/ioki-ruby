# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Money < Base
        def self.schema_path
          'money'
        end

        attribute :type, type: :string
        attribute :amount, type: :integer
        attribute :currency, type: :string
        attribute :vat_rate, type: :float
      end
    end
  end
end
