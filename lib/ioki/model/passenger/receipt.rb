# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Receipt < Base
        attribute :attachment_url, on: :read, type: :string
        attribute :receipt_type, on: :read, type: :string
      end
    end
  end
end
