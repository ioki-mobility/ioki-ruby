# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Area < Ioki::Model::Base
        attribute :coordinates, type: :array, on: :read
        attribute :type, type: :string, on: :read
      end
    end
  end
end
