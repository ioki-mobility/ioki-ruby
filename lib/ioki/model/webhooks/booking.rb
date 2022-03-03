# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Booking < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :verification_code, type: :string
      end
    end
  end
end
