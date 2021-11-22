# frozen_string_literal: true

module Ioki
  class PlatformClient < Client
    def initialize
      super(Ioki::Configuration.from_env('PLATFORM'), Ioki::PlatformApi)
    end
  end
end
