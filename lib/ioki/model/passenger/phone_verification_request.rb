# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class PhoneVerificationRequest < Base
        attribute :phone_number, type: :string, on: :create
        attribute :us_data_transfer_accepted, type: :bool, on: :create
      end
    end
  end
end
