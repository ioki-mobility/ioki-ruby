# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Permission < Base
        attribute :type, type: :string
        attribute :identifier, type: :string
        attribute :resource_id, type: :string
        attribute :resource_type, type: :string
      end
    end
  end
end
