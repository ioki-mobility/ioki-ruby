# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in ioki.gemspec
gemspec

gem 'rake', '~> 13.0'
gem 'rspec', '~> 3.0'
gem 'awesome_print'
gem 'debug'

group :development, :test do
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'guard-rspec'
  gem 'webmock'
  gem 'vcr'
  gem 'simplecov', require: false
end
