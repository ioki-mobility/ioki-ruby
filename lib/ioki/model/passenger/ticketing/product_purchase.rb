# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Ticketing
        class ProductPurchase < Base
          attribute :purchase_options, on: :create, type: :array, class_name: 'PurchaseOption'
          attribute :redemption_options, on: :create, type: :array, class_name: 'RedemptionOption'
          attribute :ride_id, on: :create, type: :string
          attribute :payment_method, on: :create, type: :object, class_name: 'Ioki::Model::Passenger::PaymentMethod'
          attribute :paypal_secure_element, on: :create, type: :string
        end
      end
    end
  end
end
