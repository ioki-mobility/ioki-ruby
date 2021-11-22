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

Basic usage of a `Ioki::Client`
```ruby
  platform_client = Ioki::PlatformClient.new

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

See `spec/ioki/examples` for more examples.

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

or define them for one of the three supported apis with a prefix:

```ruby
ENV['IOKI_PLATFORM_API_CLIENT_IDENTIFIER']
ENV['IOKI_PASSENGER_API_VERSION'] 
...
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
