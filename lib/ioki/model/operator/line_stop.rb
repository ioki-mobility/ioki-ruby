# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class LineStop < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :tier, on: [:read, :create, :update], type: :integer
        attribute :relative_time, on: [:read, :create, :update], type: :integer
        attribute :supports_pickup, on: [:read, :create, :update], type: :boolean
        attribute :supports_dropoff, on: [:read, :create, :update], type: :boolean
        attribute :supports_pass_through, on: [:read, :create, :update], type: :boolean
        attribute :station_id, on: [:read, :create], type: :string
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
