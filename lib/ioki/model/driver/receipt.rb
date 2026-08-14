# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Receipt < Base
        attribute :updated_at, type: :string, on: [:create, :read, :update]
        attribute :created_at, type: :string, on: [:create, :read, :update]
        attribute :id, type: :string, on: [:create, :read, :update]
        attribute :type, type: :string, on: [:create, :read, :update]
        attribute :attachment_url, on: :read, type: :string
        # attribute :purchasable_id, on: :read, type: :string
        # attribute :purchasable_type, on: :read, type: :string
        deprecated_attribute :receipt_type, on: :read, type: :string
        # attribute :topic, on: :read, type: :string
        # attribute :user_id, on: :read, type: :string
      end
    end
  end
end
