# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class ServiceCredit < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :version, type: :integer
        attribute :balance, type: :object, class_name: 'Money'
        attribute :cost, type: :object, class_name: 'Money'
        attribute :payment_method, type: :object, class_name: 'PaymentMethod'
        attribute :user, type: :object, class_name: 'User'
        attribute :value, type: :object, class_name: 'Money'
      end
    end
  end
end
