# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Base < Ioki::Model::Base
        def self.specification_scope
          'driver_api'
        end

        attribute :id,         on: :read, type: :string
        attribute :type,       on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
      end
    end
  end
end
