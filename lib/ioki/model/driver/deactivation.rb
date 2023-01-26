# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Deactivation < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :ends_at, on: :read, type: :date_time
        attribute :starts_at, on: :read, type: :date_time
      end
    end
  end
end
