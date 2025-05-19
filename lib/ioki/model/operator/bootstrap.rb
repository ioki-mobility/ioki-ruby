# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Bootstrap < Base
        attribute :type, on: :read, type: :string
        attribute :valid_timezone_identifiers, type: :array, on: :read
        attribute :valid_locales, type: :array, on: :read
        attribute :supported_locales, type: :array, on: :read
        attribute :admin, type: :object, on: :read, class_name: 'Admin'
      end
    end
  end
end
