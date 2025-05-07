# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class EmailDelivery < Base
        attribute :delivery_context, on: :create, type: :string
        attribute :user_id, on: :create, type: :string, omit_if_nil_on: :create
        attribute :mime_message, on: :create, type: :string
      end
    end
  end
end
