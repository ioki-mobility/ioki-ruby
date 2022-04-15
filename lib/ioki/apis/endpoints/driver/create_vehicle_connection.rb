# frozen_string_literal: true

# This could and should be a Endpoints::Create, but the response to the
# /driver/vehicle_connection endpoint is an empty string (?)
# which fails in the Endpoints::Create#call method on parsed_response['data']
module Endpoints
  module Driver
    class CreateVehicleConnection
      def name
        'create_vehicle_connection'
      end

      def call(client, args = [], _options = {})
        model = args.first
        unless model.is_a?(Ioki::Model::Driver::VehicleConnection)
          raise(ArgumentError, "#{model} is not an instance of Ioki::Model::Driver::VehicleConnection")
        end

        client.request(
          url:    client.build_request_url('driver', 'vehicle_connection'),
          method: :post,
          body:   { data: model.serialize(:create) }
        )
      end
    end
  end
end
