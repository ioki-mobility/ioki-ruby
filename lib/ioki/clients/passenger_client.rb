# frozen_string_literal: true

module Ioki
  class PassengerClient < Client
    def initialize
      super(Ioki::Configuration.from_env('PASSENGER'), Ioki::PassengerApi)
    end
  end
end
