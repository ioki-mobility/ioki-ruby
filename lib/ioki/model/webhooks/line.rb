# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Line < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :name, type: :string
        attribute :slug, type: :string
        attribute :mode, type: :string
        attribute :route_number, type: :string
        attribute :skip_time_window_check, type: :boolean
        attribute :variant, type: :string
        attribute :product_id, type: :string
      end
    end
  end
end
