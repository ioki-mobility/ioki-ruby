# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Area < Base
        attribute :coordinates, type: :array, on: :read
      end
    end
  end
end
