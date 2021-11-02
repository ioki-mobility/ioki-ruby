# frozen_string_literal: true

module ExtendedClientHelpers
  def setup_platform_client(client_name)
    let(client_name) { build_platform_client }
  end

  def setup_passenger_client(client_name)
    let(client_name) { build_passenger_client }
  end

  def setup_driver_client(client_name)
    let(client_name) { build_driver_client }
  end
end

module IncludedClientHelpers
  def build_platform_client
    Ioki::Client.new(
      Ioki::Configuration.new(
        api_base_url:          ENV['IOKI_PLATFORM_API_BASE_URL'],
        api_version:           ENV['IOKI_PLATFORM_API_VERSION'],
        api_client_identifier: ENV['IOKI_PLATFORM_API_CLIENT_IDENTIFIER'],
        api_client_secret:     ENV['IOKI_PLATFORM_API_CLIENT_SECRET'],
        api_client_version:    ENV['IOKI_PLATFORM_API_CLIENT_VERSION'],
        api_token:             ENV['IOKI_PLATFORM_API_TOKEN']
      ),
      Ioki::PlatformApi
    )
  end

  def with_platform_client(&block)
    platform_client = build_platform_client
    block.call(platform_client)
  end

  def build_passenger_client
    Ioki::Client.new(
      Ioki::Configuration.new(
        api_base_url:          ENV['IOKI_PASSENGER_API_BASE_URL'],
        api_version:           ENV['IOKI_PASSENGER_API_VERSION'],
        api_client_identifier: ENV['IOKI_PASSENGER_API_CLIENT_IDENTIFIER'],
        api_client_secret:     ENV['IOKI_PASSENGER_API_CLIENT_SECRET'],
        api_client_version:    ENV['IOKI_PASSENGER_API_CLIENT_VERSION'],
        api_token:             ENV['IOKI_PASSENGER_API_TOKEN']
      ),
      Ioki::PassengerApi
    )
  end

  def with_passenger_client(&block)
    passenger_client = build_passenger_client
    block.call(passenger_client)
  end

  def build_driver_client
    Ioki::Client.new(
      Ioki::Configuration.new(
        api_base_url:          ENV['IOKI_DRIVER_API_BASE_URL'],
        api_version:           ENV['IOKI_DRIVER_API_VERSION'],
        api_client_identifier: ENV['IOKI_DRIVER_API_CLIENT_IDENTIFIER'],
        api_client_secret:     ENV['IOKI_DRIVER_API_CLIENT_SECRET'],
        api_client_version:    ENV['IOKI_DRIVER_API_CLIENT_VERSION'],
        api_token:             ENV['IOKI_DRIVER_API_TOKEN']
      ),
      Ioki::DriverApi
    )
  end

  def with_driver_client(&block)
    driver_client = build_driver_client
    block.call(driver_client)
  end
end

RSpec.configure do |c|
  c.extend ExtendedClientHelpers
  c.include IncludedClientHelpers
end
