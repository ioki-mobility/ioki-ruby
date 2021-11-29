# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class ImageVersion < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not define :id, :type, :created_at and :updated_at.

        unvalidated true # Specification not available

        attribute :large, on: :read, type: :string
        attribute :medium, on: :read, type: :string
        attribute :small, on: :read, type: :string
        attribute :mini, on: :read, type: :string
      end
    end
  end
end
