# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class RedeemedPromoCode < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :asset_id, type: :string, on: :read
        attribute :asset_type, type: :string, on: :read
        attribute :code, type: :string, on: [:read, :create]
        attribute :description, type: :string, on: :read
        attribute :product_id, type: :string, on: :read
        attribute :promo_code_type, type: :string, on: :create
        attribute :title, type: :string, on: :read
        attribute :url, type: :string, on: :read
      end
    end
  end
end
