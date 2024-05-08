# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Ticketing
        class Voucher < Base
          attribute :type, on: :read, type: :string
          attribute :id, on: :read, type: :string
          attribute :created_at, on: :read, type: :date_time
          attribute :updated_at, on: :read, type: :date_time
          attribute :provider_id, on: :read, type: :string
          attribute :user_id, on: :read, type: :string
          attribute :ride_id, on: :read, type: :string
          attribute :state, on: :read, type: :string
          attribute :product, on: :read, type: :object, class_name: 'Product'
          attribute :ticket, on: :read, type: :object, class_name: 'Ticket'
          attribute :payment_method, on: :read, type: :object, class_name: 'Ioki::Model::Passenger::PaymentMethod'
          attribute :price, on: :read, type: :object, class_name: 'Ioki::Model::Passenger::Money'
          attribute :purchase_option_values, on: :read, type: :array, class_name: 'OptionValue'
          attribute :redemption_option_values, on: :read, type: :array, class_name: 'OptionValue'
          attribute :renewal_information, on: :read, type: :object, class_name: 'VoucherRenewalInformation'
        end
      end
    end
  end
end
