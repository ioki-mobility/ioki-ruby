# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class LineStop < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :relative_time, type: :integer
        attribute :station_id, type: :string
        attribute :line_id, type: :string
        attribute :dropoff_mode, type: :string
        attribute :pickup_mode, type: :string
        attribute :supports_pickup, type: :boolean
        attribute :supports_dropoff, type: :boolean
        attribute :supports_pass_through, type: :boolean
        attribute :tier, type: :integer
        attribute :product_id, type: :string
      end
    end
  end
end
