# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Journey < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :version, type: :integer
        attribute :legs, type: :array
      end
    end
  end
end
