# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Tip < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :ride_id, type: :string
        attribute :amount_object, type: :object, class_name: 'Money'
        attribute :driver, type: :object, class_name: 'Driver'
        attribute :payment_method, type: :object, class_name: 'PaymentMethod'
      end
    end
  end
end
