# frozen_string_literal: true

module Endpoints
  # This could and should be a Endpoints::Create, but the response to the
  # /driver/vehicle_connection endpoint is an empty string (?)
  # which fails in the Endpoints::Create#call method on parsed_response['data']
  class VehicleConnection
    def name
      'vehicle_connection'
    end

    def call(client, args = [], options = {})
      client.request(
        url:    client.build_request_url('driver', 'vehicle_connection'),
        method: :post,
        body:   { data: { license_plate: args.first } }
      )
    end
  end
end
