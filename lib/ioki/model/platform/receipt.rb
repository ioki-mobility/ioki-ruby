# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Receipt < Base
        attribute :charge_id, type: :string, on: [:create, :read, :update]
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :attachment_url, on: :read, type: :string
        deprecated_attribute :purchasable_id, on: :read, type: :string
        deprecated_attribute :purchasable_type, on: :read, type: :string
        deprecated_attribute :receipt_type, on: :read, type: :string
        deprecated_attribute :topic, on: :read, type: :string
        attribute :user_id, on: :read, type: :string
      end
    end
  end
end
