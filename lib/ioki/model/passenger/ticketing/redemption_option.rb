# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Ticketing
        class RedemptionOption < Base
          attribute :type, on: :read, type: :string
          attribute :slug, on: [:read, :create], type: :string
          attribute :name, on: :read, type: :string
          attribute :description, on: :read, type: :string
          attribute :data_type, on: :read, type: :string
          attribute :data_format, on: :read, type: :string
          attribute :data_enum, on: :read, type: :boolean
          attribute :required, on: :read, type: :boolean
          attribute :enum_items, on: :read, type: :array, class_name: 'Ioki::Model::Passenger::EnumItem'
          attribute :value, on: :create, type: :string
        end
      end
    end
  end
end
