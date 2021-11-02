# Ioki - Client

The ioki client is made to conveniently use all of Ioki's several APIs and parse the results into ruby objects to be 
used in other ruby code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ioki'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ioki

It's recommended to configure using shared git hooks from `.git-hooks` by running:

`git config core.hooksPath .git-hooks`

## Example Usage

Simple usage of a `Ioki::Client`
```ruby
  platform_client = Ioki::Client.new(
    Ioki::Configuration.new(
      api_client_identifier: 'com.ioki.example.client',
      api_client_secret:     'XYZ',
      api_client_version:    '0.0.1',
      api_token:             '123456'
    ),
    Ioki::PlatformApi
  )

  providers = platform_client.providers
  # returns a list of Ioki::Model::Platform::Provider instances

  products = platform_client.products
  # returns a list of Ioki::Model::Platform::Product instances

  stations = platform_client.stations(products.first, options: { auto_paginate: true })
  # stations are a scoped endpoint within products, to the interface requires
  # either a product or a product id as the first parameter.
  # This call will then fetch the index of stations. This example also shows
  # auto_pagination, which keeps calling the index until the last page was
  # fetched. Bear in mind, that auto_pagination might be extremely expensive.

  new_station = Ioki::Model::Platform::Station.new(
    location_name: 'Test',
    station_type: 'virtual',
    lat: stations.first.lat,
    lng: stations.first.lng
  )

  created_station = platform_client.create_station(products.first, new_station)

  # created_station has an id. it is a new model instance and has nothing to do
  # with the new_station that got passed in - it is simply parsed back from
  # the response body internally.

  platform_client.delete_station(products.first, created_station)
  # will delete the formerly created station
```

Sending arbitrary Parameters, example with pagination:

```ruby
  rides = platform_client.rides(
    'prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556',
    options: { params: { per_page: 5, page: 3 }}
  )
```

## Configuration
If a project requires only a specific client setup, one can set the defaults on
the config (Ioki.config) via calling `Ioki.configure`; for example within a Rails
initializer you could do it like this:

```ruby
  # frozen_string_literal: true

  Rails.application.reloader.to_prepare do
    Ioki.configure do |cfg|
      cfg.http_adapter          = Rails.env.test? ? :test : :faraday
      cfg.verbose_output        = Rails.env.development? || Rails.env.test?
      cfg.logger                = Rails.logger
      cfg.api_base_url          = 'https://demo.io.ki/api/'
      cfg.api_client_identifier = 'com.ioki.example.client'
      cfg.api_client_version    = '0.0.1'

      # As you should not put secrets into your source code, you probably want
      # to NOT use these:
      # cfg.api_client_secret = ...
      # cfg.api_token = ...
    end
  end
```

The `Ioki::Configuration` will also try to load defaults from the ENV, so one can
use ENV variables, to inject data - this is especially useful for the api_token
and api_client_secret. You can setup these ENV variables:

```ruby
  ENV['IOKI_HTTP_ADAPTER']
  ENV['IOKI_VERBOSE_OUTPUT']
  ENV['IOKI_API_BASE_URL']
  ENV['IOKI_API_VERSION']
  ENV['IOKI_API_CLIENT_IDENTIFIER']
  ENV['IOKI_API_CLIENT_SECRET']
  ENV['IOKI_API_CLIENT_VERSION']
  ENV['IOKI_API_TOKEN']
```

Values passed directly into `Ioki::Client.new` constructor take precedence over
the values in `Ioki.config`. Ioki.config will respect the values set up by
`Ioki.configure`. If not set, it will take the ENV value and finally fall back
for most configurable attributes to a baked in default.

## Logger

The logger can be set to any object that follows the "Rails logger" contract,
i.e. responding to #debug and alike. If no logger is set up, `Ioki::StdOutLogger`
will be used, which uses `Kernel#puts`.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. If you have access to the open API definitions of iokis APIs you can add `driver_api.json`, `passenger_api.json` and/or `driver_api.json` to `fixtures/open_api_definitions` and the specs will check if the models are compatible with the current API version. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

You can use `rake c` to start an interactive console. If you make code changes entering `reload!` in the console will load the current files again.


## More examples:

### Create, book and confirm a ride with the platform API

```ruby
platform_client = Ioki::Client.new(Ioki::Configuration.new, Ioki::PlatformApi)

sta_1 = platform_client.stations("prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556").first
sta_2 = platform_client.stations("prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556").last

ride = Ioki::Model::Platform::Ride.new(
  {
    origin: {
      lat: sta_1.lat,
      lng: sta_1.lng,
      time: Time.at(Time.now.to_i + 7200).to_s
    },
    destination: {
      lat: sta_2.lat,
      lng: sta_2.lng
    },
    user_id: 'usr_6ab72037-eea1-49ae-9720-55022f5e1267',
    passengers: [
      { type: 'adult' }
    ],
    storage_spaces: 0
  },
)

new_ride = platform_client.create_ride("prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556", ride)

reloaded_ride = nil

60.times do
  puts "waiting for matching..."

  reloaded_ride = platform_client.ride("prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556", new_ride.id)

  break if reloaded_ride.state != 'searching'

  sleep 1
end

puts "Ride #{reloaded_ride.id} is now: #{reloaded_ride.state} (Version: #{reloaded_ride.version})"

booked_ride = nil

if (reloaded_ride.state == 'ready')
  booking = Ioki::Model::Platform::Booking.new({
    ride_version: reloaded_ride.version,
    payment_method: {
      payment_method_type: 'cash'
    }
  })

  new_booking = platform_client.create_booking("prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556", reloaded_ride.id, booking)

  puts "Ride was booked!"

  booked_ride = platform_client.ride("prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556", new_ride.id)

  confirmed_ride = nil

  60.times do
    puts "waiting for driver to confirm the ride..."

    confirmed_ride = platform_client.ride("prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556", new_ride.id)

    break if confirmed_ride.state != 'passenger_accepted'

    sleep 1
  end

  puts "Ride #{confirmed_ride.id} is now: #{confirmed_ride.state} (Version: #{confirmed_ride.version})"

  if confirmed_ride.state == 'driver_accepted'
    puts "Your booking was confirmed!"
    puts "Your booking Code: '#{booked_ride.booking.verification_code}'"
    puts "Pickup:  #{booked_ride.pickup.lat}/#{booked_ride.pickup.lng} @ Station ID: #{booked_ride.pickup.station_id}"
    puts "Dropoff: #{booked_ride.dropoff.lat}/#{booked_ride.dropoff.lng} @ Station ID: #{booked_ride.dropoff.station_id}"
  end
end
```

### Using the passenger API

```ruby
require 'securerandom'

platform_client = Ioki::Client.new(
  api_base_url: ENV['IOKI_PLATFORM_API_BASE_URL'],
  api_version: ENV['IOKI_PLATFORM_API_VERSION'],
  api_client_identifier: ENV['IOKI_PLATFORM_API_CLIENT_IDENTIFIER'],
  api_client_secret: ENV['IOKI_PLATFORM_API_CLIENT_SECRET'],
  api_client_version: ENV['IOKI_PLATFORM_API_CLIENT_VERSION'],
  api_token: ENV['IOKI_PLATFORM_API_TOKEN']
)

platform_api = platform_client.platform

product_id = platform_api.products.first.id
provider_id = platform_api.providers.first.id

user_id = platform_api.create_user(
  provider_id,
  Ioki::Model::Platform::User.new(
    first_name: 'Mose',
    last_name: 'Kiszka',
    external_id: SecureRandom.uuid,
    terms_accepted: true
  )
).id

request_token = platform_api.create_request_token(
  provider_id,
  user_id,
  Ioki::Model::Platform::PassengerRequestToken.new(
    client_identifier: 'dev.passengerapi.test.backend'
  )
)

passenger_api = Ioki::Client.new(
  api_base_url: ENV['IOKI_PASSENGER_API_BASE_URL'],
  api_version: ENV['IOKI_PASSENGER_API_VERSION'],
  api_client_identifier: ENV['IOKI_PASSENGER_API_CLIENT_IDENTIFIER'],
  api_client_secret: ENV['IOKI_PASSENGER_API_CLIENT_SECRET'],
  api_client_version: ENV['IOKI_PASSENGER_API_CLIENT_VERSION'],
  api_token: request_token.token
).passenger

station1 = platform_api.stations(product_id).first
station2 = platform_api.stations(product_id).last

new_ride = Ioki::Model::Passenger::Ride.new(
  product_id: product_id,
  origin: {
    lat: station1.lat,
    lng: station1.lng,
    time: Time.at(Time.now.to_i + 7200).to_s
  },
  destination: {
    lat: station2.lat,
    lng: station2.lng
  },
  passengers: Ioki::Model::Passenger::RidePassenger.new(type: 'adult')
)

created_ride = passenger_api.create_ride(new_ride)

5.times do
  puts "waiting for matching..."

  sleep 1
  
  # Providing the complete model like this allows using etag headers to reduce traffic. 
  # Notice the 304 response on repeated calls.
  created_ride = passenger_api.ride(created_ride)
end

passenger_api.create_cancellation(
  created_ride.id,
  model: Ioki::Model::Passenger::Cancellation.new(
    ride_version: created_ride.version.to_i,
    cancellation_reason: 'I found something better'
  )
)
```

See `specs/vcr` for even more examples.
