# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class NestedDriver < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :first_name, type: :string
        attribute :last_name, type: :string
        attribute :product_id, type: :string
        attribute :username, type: :string
      end
    end
  end
end
