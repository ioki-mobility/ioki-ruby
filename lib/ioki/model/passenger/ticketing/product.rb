# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Ticketing
        class Product < Base
        attribute :renewable, type: :boolean, on: [:create, :read, :update]
          attribute :type, on: :read, type: :string
          attribute :id, on: :read, type: :string
          attribute :created_at, on: :read, type: :date_time
          attribute :updated_at, on: :read, type: :date_time
          attribute :provider_id, on: :read, type: :string
          attribute :ticketing_vendor_id, on: :read, type: :string
          attribute :slug, on: :read, type: :string
          attribute :name, on: :read, type: :string
          attribute :description, on: :read, type: :string
          attribute :purchasable, on: :read, type: :boolean
          attribute :purchasable_from, on: :read, type: :date_time
          attribute :purchasable_until, on: :read, type: :date_time
          attribute :price_type, on: :read, type: :string
          attribute :icon_type, on: :read, type: :string
          attribute :price, on: :read, type: :object, class_name: 'Ioki::Model::Passenger::Money'
          attribute :purchase_options, on: :read, type: :array, class_name: 'PurchaseOption'
          attribute :redemption_options, on: :read, type: :array, class_name: 'RedemptionOption'
        end
      end
    end
  end
end
