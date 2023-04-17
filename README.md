# Ioki - Client

The ioki client is made to conveniently use all of Ioki's several APIs and parse the results into ruby objects to be 
used in other ruby code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ioki-ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ioki-ruby

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

  stations = platform_client.stations(products.first, paginate: true)
  # stations are a scoped endpoint within products, so the interface requires
  # either a product or a product id as the first parameter.
  # This call will then fetch the index of stations. Use `paginate: true` to
  # receive pagination information in the response. Otherwise, only the data of
  # the first page is returned.
  unless stations.meta.last_page
    next_page = stations.meta.page + 1
    stations = platform_client.stations(products.first, params: {page: next_page}, paginate: true)
  end

  new_station = Ioki::Model::Platform::Station.new(
    location_name: 'Test',
    station_type: 'virtual',
    lat: stations.data.first.lat,
    lng: stations.data.first.lng
  )

  created_station = platform_client.create_station(products.first, new_station)

  # created_station has an id. it is a new model instance and has nothing to do
  # with the new_station that got passed in - it is simply parsed back from
  # the response body internally.

  platform_client.delete_station(products.first, created_station)
  # will delete the formerly created station

  stations = platform_client.stations(products.first, auto_paginate: true)
  # This example shows auto_pagination, which keeps calling the index until the
  # last page was fetched. Bear in mind, that auto_pagination might be extremely
  # expensive.
  first_station = stations.first
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
      cfg.api_bleeding_edge     = false

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
  ENV['IOKI_API_BLEEDING_EDGE']
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

## Webhooks

Webhooks are a way to receive updates about changes when they happen on the
backend servers. They are **pushed** to your application, where the other APIs
are **pulled** from the backend. In this regard they are very different from
the Platform/Driver/Passenger/Operator API. What they have in common, is that
the data is serialized in a specific manner, which ioki-ruby can turn into a
model in the Ioki::Model::Webhooks module.

When you have the requests POST body in a `params` hash, you can convert that
to an `Event` instance, which has a `model` attribute which is the deserialized
webhook `data` as a model:

```ruby
  @event = Ioki::Webhooks::Event.new params
  @model = @event.model
  # The event also gives you access to other attributes:
  puts @event.provider_id
  puts @event.event_type
  puts @event.created_at
```

Because the data is pushed to your application via the internet to a public
endpoint in your application, the webhook data is signed by the ioki webhooks
API to authenticate it using a preshared secret, which you need to provide.

```
# Set ENV['IOKI_WEBHOOK_SIGNATURE_KEY'] first...
# Then run the validation on the request

Ioki::Webhooks::SignatureValidator.new(
  body:          request.body.read,
  signature:     request.headers['X-Signature'],
  signature_key: ENV.fetch('IOKI_WEBHOOK_SIGNATURE_KEY', nil)
).call

```

## Logger

The logger can be set to any object that implements the ruby `Logger` contract,
i.e. responding to #debug and alike. If no logger is set up no logging occurs.
A simple logger to standard out looks like this:

```ruby
require 'logger'

Ioki::Configuration.new(
  logger:         Logger.new(STDOUT),
  logger_options: { headers: true, bodies: false, log_level: :info }
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. If you have access to the open API definitions of iokis APIs you can add `driver_api.json`, `passenger_api.json` and/or `driver_api.json` to `fixtures/open_api_definitions` and the specs will check if the models are compatible with the current API version. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

You can use `rake c` to start an interactive console. If you make code changes entering `reload!` in the console will load the current files again.

## Release

Change the version number in 'lib/ioki/version.rb' to `1.2.3`. We use semantic versioning: https://semver.org/

Once this version number has been pushed to github, you have to tag that commit with the same version number. This can be done locally or on github.com when creating the release.

### Create the tag locally

Tag the commit in which you changed the version number and push it to github

```
git tag -a '1.2.3' 0000COMMITHASHID00000000COMMITHASHID0000 -m 'Releasing Version 1.2.3'
git push --atomic origin main '1.2.3'
```

### Create the release

How to create the release, with or without creating a tag on github is described here:

https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository

Please do make use of the release notes feature to automatically create a changelog.

## Testing

ioki-ruby uses Faraday under the hood to make requests to the API.

If you would like to make those request with fast predictable results in you test suite, you can pass in your own [Faraday::Connection stub](https://lostisland.github.io/faraday/adapters/testing).


```ruby
  let(:client)       { Ioki::Client.new(config, Ioki::PlatformApi) }
  let(:config)       { Ioki::Configuration.new http_adapter: http_adapter }
  let(:http_adapter) { Faraday.new('https://example.com/api') { |f| f.adapter :test, stubs } }
  let(:stubs)        { Faraday::Adapter::Test::Stubs.new }

  it 'can retrieve provider data from the providers endpoint' do
    stubs.get("/api/platform/providers") do |env|
      [ 200, {}, { 'data' => [{ 'id' => '123', 'city' => 'Somewhere'}] } ]
    end
    expect(client.providers.first).to be_a Ioki::Model::Platform::Provider
    expect(client.providers.first.city).to eq('Somewhere')
  end
```

### OpenApi specifications

If you're allowed to access the OpenAPI-specifications for the three APIs you can place them in `spec/fixtures/open_api_definitions`. `open_api_spec` will then compare theses specs with the matching models. You can define `specification_scope` on the model to set the prefix the specs are looking for in the OpenApi-schema file and `schema_path` if the name of the schema is not the snake_case version of the class name and define `unvalidated true` to mark that no specification exists for a model.
Sometimes it's also helpful to disable the check for specific attributes. You can pass `unvalidated: true` as an option to the `attribute` definition.
