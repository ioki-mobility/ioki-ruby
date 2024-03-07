# frozen_string_literal: true

module ExtendedClientHelpers
  def setup_platform_client(client_name)
    let(client_name) { Ioki::PlatformClient.new }
  end

  def setup_operator_client(client_name)
    let(client_name) { Ioki::OperatorClient.new }
  end

  def setup_passenger_client(client_name)
    let(client_name) { Ioki::PassengerClient.new }
  end

  def setup_driver_client(client_name)
    let(client_name) { Ioki::DriverClient.new }
  end

  def setup_reporting_client(client_name)
    let(client_name) { Ioki::ReportingClient.new }
  end
end

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

  def with_operator_client(&block)
    operator_client = Ioki::OperatorClient.new
    block.call(operator_client)
  end

  def with_reporting_client(&block)
    reporting_client = Ioki::ReportingClient.new
    block.call(reporting_client)
  end
end

RSpec.configure do |c|
  c.extend ExtendedClientHelpers
  c.include IncludedClientHelpers
end
