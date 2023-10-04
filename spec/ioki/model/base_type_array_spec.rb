# frozen_string_literal: true

require 'spec_helper'
require 'ioki/apis/endpoints/endpoints'

RSpec.describe Ioki::Model::Base do
  let(:client) { Ioki::Client.new(Ioki::Configuration.new, Ioki::PassengerApi) }

  it 'sends multi-type values' do
    create_ride_request = stub_request(:post, 'https://app.io.ki/api/passenger/rides')
      .with(body: {
              data: {
                origin:                         {},
                destination:                    {},
                passengers:                     [{
                  type:    'adult',
                  options: [
                    {
                      name:  'a_boolean_option',
                      value: true
                    },
                    {
                      name:  'a_string_option',
                      value: 'a_string'
                    },
                    {
                      name:  'an_integer_option',
                      value: 13
                    }
                  ]
                }],
                book_for_others:                nil,
                cancellable:                    nil,
                cancellation_reason:            nil,
                cancellation_reason_translated: nil,
                driver_can_be_called:           nil,
                needs_cancellation_code:        nil,
                passenger_can_be_called:        nil,
                payment_state:                  nil,
                prebooked:                      nil,
                product_id:                     'prd_1',
                public_transport_uri:           nil,
                rateable:                       nil,
                receipts:                       nil,
                route:                          nil,
                state:                          nil,
                support_uri:                    nil,
                tip:                            nil,
                tippable:                       nil,
                valid_for_driver_until:         nil,
                valid_for_passenger_until:      nil,
                vehicle:                        nil,
                vehicle_reached_dropoff:        nil,
                vehicle_reached_pickup:         nil,
                options:                        nil
              }
            })
      .to_return_json(
        { status: 200, body: { data: [] }.to_json }
      )

    ride = Ioki::Model::Passenger::Ride.new(
      user_id:     'usr_1',
      product_id:  'prd_1',
      origin:      {},
      destination: {},
      passengers:  [
        Ioki::Model::Passenger::RidePassenger.new(
          type:    'adult',
          options: [
            Ioki::Model::Passenger::PassengerOption.new(
              name:  'a_boolean_option',
              value: true
            ),
            Ioki::Model::Passenger::PassengerOption.new(
              name:  'a_string_option',
              value: 'a_string'
            ),
            Ioki::Model::Passenger::PassengerOption.new(
              name:  'an_integer_option',
              value: 13
            )
          ]
        )
      ]
    )

    client.create_ride(ride)

    expect(create_ride_request).to have_been_requested.once
  end

  it 'receives multi-type values' do
    get_ride_request = stub_request(:get, 'https://app.io.ki/api/passenger/rides/rid_1')
      .to_return_json(
        status: 200,
        body:   { data: {
          origin:                         {},
          destination:                    {},
          passengers:                     [{
            type:    'adult',
            options: [
              {
                name:  'a_boolean_option',
                value: true
              },
              {
                name:  'a_string_option',
                value: 'a_string'
              },
              {
                name:  'an_integer_option',
                value: 13
              }
            ]
          }],
          book_for_others:                nil,
          cancellable:                    nil,
          cancellation_reason:            nil,
          cancellation_reason_translated: nil,
          driver_can_be_called:           nil,
          needs_cancellation_code:        nil,
          passenger_can_be_called:        nil,
          payment_state:                  nil,
          prebooked:                      nil,
          product_id:                     'prd_1',
          public_transport_uri:           nil,
          rateable:                       nil,
          receipts:                       nil,
          route:                          nil,
          support_uri:                    nil,
          tip:                            nil,
          tippable:                       nil,
          valid_for_driver_until:         nil,
          valid_for_passenger_until:      nil,
          vehicle:                        nil,
          vehicle_reached_dropoff:        nil,
          vehicle_reached_pickup:         nil,
          options:                        nil
        } }.to_json
      )

    response = client.ride('rid_1')
    expect(response.passengers.first.options.map(&:value)).to match_array [
      true, 'a_string', 13
    ]

    expect(get_ride_request).to have_been_requested.once
  end
end
