# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Booking < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :verification_code,
                  type: :string,
                  on:   [:read, :update]

        # The model does not return it but it's used when sending data to the server.
        attribute :ride_version,
                  type:        :integer,
                  on:          :create,
                  unvalidated: true

        # The model does not return it but it's used when sending data to the server.
        attribute :payment_method,
                  type:           :object,
                  on:             :create,
                  class_name:     'PaymentMethod',
                  unvalidated:    true,
                  omit_if_nil_on: :create
      end
    end
  end
end
