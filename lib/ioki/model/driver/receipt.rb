# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Receipt < Base
        unvalidated true # This shouldn't be but there is no definition in the driver_api.json

        attribute :attachment_url, on: :read, type: :string
        attribute :purchasable_id, on: :read, type: :string
        attribute :purchasable_type, on: :read, type: :string
        attribute :receipt_type, on: :read, type: :string
        attribute :topic, on: :read, type: :string
        attribute :user_id, on: :read, type: :string
      end
    end
  end
end
