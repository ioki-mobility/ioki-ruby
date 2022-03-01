# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PhoneVerificationRequest < Base
        attribute :phone_number, on: [:read, :create], type: :string
        attribute :locale, on: [:create], type: :string
      end
    end
  end
end
