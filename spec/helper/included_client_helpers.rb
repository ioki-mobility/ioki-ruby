# frozen_string_literal: true

module IncludedClientHelpers
  def with_platform_client(&block)
    platform_client = Ioki::PlatformClient.new
    block.call(platform_client)
  end

  def with_passenger_client(&block)
    passenger_client = Ioki::PassengerClient.new
    block.call(passenger_client)
  end

  def with_driver_client(&block)
    driver_client = Ioki::DriverClient.new
    block.call(driver_client)
  end
end

RSpec.configure do |c|
  c.include IncludedClientHelpers
end
