# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Provider < Base
        attribute :city, on: :read
        attribute :name, on: :read
      end
    end
  end
end
