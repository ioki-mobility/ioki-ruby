# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class MatchingConfiguration < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :name, type: :string
        attribute :slug, type: :string
        attribute :area, type: :object, class_name: 'Geojson'
      end
    end
  end
end
