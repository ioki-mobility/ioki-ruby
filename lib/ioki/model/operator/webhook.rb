# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Webhook < Base
        attribute :api_version, on: :read, type: :string
        attribute :subscribed_event_types, on: :read, type: :array
        attribute :subscribed_to_all_event_types, on: :read, type: :boolean
        attribute :webhook_url, on: :read, type: :string
      end
    end
  end
end
