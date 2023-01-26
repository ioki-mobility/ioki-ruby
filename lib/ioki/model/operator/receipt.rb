# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Receipt < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
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
