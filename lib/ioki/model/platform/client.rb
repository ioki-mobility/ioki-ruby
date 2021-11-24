# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Client < Ioki::Model::Base
        # Note that this does not inherit from Base because :created_at, :updated_at and :id are not defined.

        def self.specification_scope
          'platform_api--v20210101'
        end

        attribute :type, on: :read, type: :string
        attribute :allows_external_payment, on: :read, type: :boolean
        attribute :current_version, on: :read, type: :string
        attribute :identifier, on: :read, type: :string
        attribute :min_version, on: :read, type: :string
        attribute :name, on: :read, type: :string
      end
    end
  end
end
