# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Base < Ioki::Model::Base
        def self.specification_scope
          'platform_api--v20210101'
        end

        attribute :id,         on: :read, type: :string
        attribute :type,       on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
      end
    end
  end
end
