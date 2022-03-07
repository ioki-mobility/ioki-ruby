# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Admin < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :email, type: :string
        attribute :first_name, type: :string
        attribute :last_name, type: :string
      end
    end
  end
end
