# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ProductValidation < Base
        attribute :product_bulletins,
                  on:         :read,
                  type:       :array,
                  class_name: 'ProductBulletin'
      end
    end
  end
end
