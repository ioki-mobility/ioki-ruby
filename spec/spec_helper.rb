# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'bundler/setup'
require 'awesome_print'
require 'pry'
require 'ioki'
require 'vcr'
require 'webmock/rspec'
require 'helper/string_helper'
require 'helper/client_helpers'
require 'helper/openapi_matcher'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.run_all_when_everything_filtered = true

  config.filter_run_when_matching :focus

  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end
end

ENV['IOKI_PLATFORM_API_BASE_URL']  ||= 'https://demo.io.ki/api/'
ENV['IOKI_PASSENGER_API_BASE_URL'] ||= 'https://demo.io.ki/api/'
ENV['IOKI_DRIVER_API_BASE_URL']    ||= 'https://demo.io.ki/api/'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<X-Client-Secret>') do |interaction|
    interaction.request.headers['X-Client-Secret'].first
  end
  config.filter_sensitive_data('<Authorization>') do |interaction|
    interaction.request.headers['Authorization'].first
  end
end
