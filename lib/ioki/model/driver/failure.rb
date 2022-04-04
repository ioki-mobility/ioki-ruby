# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Failure < Base
        attribute :api_errors, on: :read, type: :array
        attribute :debug_information, on: :read, type: :object
        attribute :validation_errors, on: :read, type: :array
      end
    end
  end
end
