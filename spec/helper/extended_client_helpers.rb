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
end

RSpec.configure do |c|
  c.extend ExtendedClientHelpers
end
