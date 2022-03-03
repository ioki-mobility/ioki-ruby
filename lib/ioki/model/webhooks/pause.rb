# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Pause < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :actual_ends_at, type: :date_time
        attribute :actual_starts_at, type: :date_time
        attribute :planned_ends_at, type: :date_time
        attribute :planned_starts_at, type: :date_time
        attribute :preserve_duration, type: :boolean
        attribute :place, type: :object, class_name: 'Place'
      end
    end
  end
end
