# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class ServiceCreditOptions < Base
        unvalidated true

        attribute :packages, on: :read, type: :array, class_name: 'Package'
      end
    end
  end
end
