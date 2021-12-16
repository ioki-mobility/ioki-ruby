# frozen_string_literal: true

RSpec.describe Ioki::Model::Passenger::MobileTicketData, :vcr do
  setup_platform_client(:platform_client)
  setup_passenger_client(:passenger_client)
  let(:product) { passenger_client.products.first }

  before do
    passenger_client.config.api_token = platform_client.create_request_token(
      platform_client.providers.first,
      platform_client.users(platform_client.providers.first).last,
      Ioki::Model::Platform::PassengerRequestToken.new(
        client_identifier: 'dev.passengerapi.test.backend'
      )
    ).token
  end

  it 'has data for all defined attributes' do
    pending('Needs a ride with a ticket that has a ticket with mobile_ticket_data')

    expect(passenger_client.rides(product).first.ticket.mobile_ticket_data).to be_a(described_class)
    expect(passenger_client.rides(product).first.ticket.mobile_ticket_data.purchase_id).to be_a(String)
    expect(passenger_client.rides(product).first.ticket.mobile_ticket_data.customer_code).to be_a(String)
  end
end
