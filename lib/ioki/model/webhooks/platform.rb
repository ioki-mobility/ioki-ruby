# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Platform < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :name, type: :string
      end
    end
  end
end
