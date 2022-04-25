# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PhoneVerification < Base
        unvalidated true

        attribute :phone_number, on: :create, type: :string
        attribute :code, on: :create, type: :string
      end
    end
  end
end
