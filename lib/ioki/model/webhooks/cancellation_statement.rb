# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class CancellationStatement < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :group, type: :string
        attribute :identifier, type: :string
        attribute :product_id, type: :string
        attribute :title, type: :string
      end
    end
  end
end
