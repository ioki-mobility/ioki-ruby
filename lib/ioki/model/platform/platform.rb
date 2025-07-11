# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Platform < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :name, on: :read, type: :string
        attribute :locale, on: :read, type: :string
        attribute :timezone_identifier, on: :read, type: :string
      end
    end
  end
end
