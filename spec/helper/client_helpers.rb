# frozen_string_literal: true

module ExtendedClientHelpers
  def setup_platform_client(client_name)
    let(client_name) { build_platform_client_from_envs }
  end

  def setup_passenger_client(client_name)
    let(client_name) { build_passenger_client_from_envs }
  end

  def setup_driver_client(client_name)
    let(client_name) { build_driver_client_from_envs }
  end
end

module IncludedClientHelpers
  def build_platform_client_from_envs
    Ioki::Client.new(Ioki::Configuration.from_env('PLATFORM'), Ioki::PlatformApi)
  end

  def with_platform_client(&block)
    platform_client = build_platform_client
    block.call(platform_client)
  end

  def build_passenger_client_from_envs
    Ioki::Client.new(Ioki::Configuration.from_env('PASSENGER'), Ioki::PassengerApi)
  end

  def with_passenger_client(&block)
    passenger_client = build_passenger_client
    block.call(passenger_client)
  end

  def build_driver_client_from_envs
    Ioki::Client.new(Ioki::Configuration.from_env('DRIVER'), Ioki::DriverApi)
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
