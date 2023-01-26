# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class LineStop < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :tier, on: [:read, :create], type: :integer
        attribute :relative_time, on: [:read, :create], type: :integer
        attribute :supports_pickup, on: [:read, :create], type: :boolean
        attribute :supports_dropoff, on: [:read, :create], type: :boolean
        attribute :supports_pass_through, on: [:read, :create], type: :boolean
        attribute :station_id, on: [:read, :create], type: :string
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
