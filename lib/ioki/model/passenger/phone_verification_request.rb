# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PhoneVerificationRequest < Base
        attribute :phone_number, type: :string, on: :create
        attribute :us_data_transfer_accepted, type: :bool, on: :create, unvalidated: true
        # The model does not return it but it's used when sending data to the server.
      end
    end
  end
end
