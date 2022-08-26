# frozen_string_literal: true

# In other cases the API uses an ID in the path to delete a record.
# In this case, no ID is used, instead, like the CreateVehicleConnection, only
# the license plate is provided in the request body.
# Therefor we cannot reuse the Endpoints::Delete class
module Ioki
  module Endpoints
    module Driver
      class DeleteVehicleConnection
        def name
          'delete_vehicle_connection'
        end

        def call(client, args = [], _options = {})
          model = args.first
          unless model.is_a?(Ioki::Model::Driver::VehicleConnection)
            raise(ArgumentError, "#{model} is not an instance of Ioki::Model::Driver::VehicleConnection")
          end

          client.request(
            url:    client.build_request_url('driver', 'vehicle_connection'),
            method: :delete,
            body:   { data: model.serialize(:create) }
          )
        end
      end
    end
  end
end
