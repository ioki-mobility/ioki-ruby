# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Ticketing
        class VoucherRenewal < Base
          def self.schema_path
            'passenger_api--v1--ticketing--voucher_renewal_information'
          end

          attribute :payment_method, on: :create, type: :object, class_name: 'Ioki::Model::Passenger::PaymentMethod'
          attribute :paypal_secure_element, on: :create, type: :string
          attribute :on_session, on: :create, type: :boolean, omit_if_nil_on: :create
          attribute :async, on: :create, type: :boolean, omit_if_nil_on: :create
        end
      end
    end
  end
end
