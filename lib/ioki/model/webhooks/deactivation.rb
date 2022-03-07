# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Deactivation < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :ends_at, type: :date_time
        attribute :starts_at, type: :date_time
      end
    end
  end
end
