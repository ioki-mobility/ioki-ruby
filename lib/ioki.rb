# frozen_string_literal: true

require 'ioki/configuration'
require 'ioki/model'
require 'ioki/error'
require 'ioki/http_adapter'
require 'ioki/client'
require 'ioki/clients/platform_client'
require 'ioki/clients/passenger_client'
require 'ioki/clients/driver_client'
require 'ioki/apis/platform_api'
require 'ioki/apis/passenger_api'
require 'ioki/apis/driver_api'
require 'ioki/version'

module Ioki
  class << self
    def config
      @config ||= Ioki::Configuration.new
    end

    def configure
      yield(config)
    end
  end
end
