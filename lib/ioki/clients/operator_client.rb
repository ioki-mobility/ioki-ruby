# frozen_string_literal: true

module Ioki
  class OperatorClient < Client
    def initialize
      super(Ioki::Configuration.from_env('OPERATOR'), Ioki::OperatorApi)
    end
  end
end
