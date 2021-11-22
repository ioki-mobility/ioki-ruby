# frozen_string_literal: true

module Ioki
  class DriverClient < Client
    def initialize
      super(Ioki::Configuration.from_env('DRIVER'), Ioki::DriverApi)
    end
  end
end
