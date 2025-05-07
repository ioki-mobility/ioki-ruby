# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ProductValidation < Base
        def self.schema_path
          'operator_api--v20210101--product_validator'
        end

        attribute :product_bulletins,
                  on:         :read,
                  type:       :array,
                  class_name: 'ProductBulletin'
      end
    end
  end
end
