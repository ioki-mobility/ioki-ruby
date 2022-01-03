# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class ServiceCreditOptions < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :id, :type, :created_at and :updated_at.

        unvalidated true

        attribute :packages, on: :read, type: :array, class_name: 'Package'
      end
    end
  end
end
