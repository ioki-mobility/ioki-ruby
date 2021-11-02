# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Provider < Base
        attribute :city, on: :read
        attribute :name, on: :read
      end
    end
  end
end
