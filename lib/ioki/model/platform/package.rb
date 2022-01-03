# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Package < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :id, :type, :created_at and :updated_at.

        unvalidated true

        attribute :cost_object, on: :read, type: :object, class_name: 'Money'
        attribute :value_object, on: :read, type: :object, class_name: 'Money'
      end
    end
  end
end
