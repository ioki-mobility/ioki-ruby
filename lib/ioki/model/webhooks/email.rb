# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Email < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :confirmed, type: :boolean
        attribute :email_address, type: :string
        attribute :newsletter, type: :boolean
        attribute :receipt, type: :boolean
      end
    end
  end
end
