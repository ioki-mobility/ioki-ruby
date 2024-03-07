# frozen_string_literal: true

module Ioki
  class ReportingClient < Client
    def initialize
      super(Ioki::Configuration.from_env('REPORTING'), Ioki::ReportingApi)
    end
  end
end
