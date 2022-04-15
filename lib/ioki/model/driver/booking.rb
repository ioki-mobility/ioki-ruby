# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Booking < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :verification_code, on: :read, type: :string
      end
    end
  end
end
