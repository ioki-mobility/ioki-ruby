# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class EmailDelivery < Base
        def self.schema_path
          'platform_api--v20210101--email_delivery_schema'
        end

        attribute :delivery_context, on: :create, type: :string
        attribute :recipient_id, on: :create, type: :string, omit_if_nil_on: :create
        attribute :recipient_type, on: :create, type: :string, omit_if_nil_on: :create
        deprecated_attribute :user_id,
                             on: :create,
                             type: :string,
                             omit_if_nil_on: :create,
                             replaced_by: :recipient_id
        attribute :mime_message, on: :create, type: :string
      end
    end
  end
end
