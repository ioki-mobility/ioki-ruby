# frozen_string_literal: true

require_relative 'lib/ioki/version'

Gem::Specification.new do |spec|
  spec.name          = 'ioki-ruby'
  spec.version       = Ioki::VERSION
  spec.authors       = ['IOKI']
  spec.email         = ['info@ioki.com']
  spec.license       = 'MIT'

  spec.summary       = <<-SUMMARY
    The ioki Gem provides a rubyesque way of accessing the ioki Rest APIs.
  SUMMARY

  spec.description = <<-DESCRIPTION
    This Gem is under massive development. It currently provides access to a few endpoints within the ioki Platform API.
    It is partly inspired by octokit.
  DESCRIPTION

  spec.homepage = 'https://github.com/ioki-mobility/ioki-ruby'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.0')

  spec.metadata = {
    'homepage_uri'          => spec.homepage,
    'changelog_uri'         => "https://github.com/ioki-mobility/ioki-ruby/releases/tag/v#{spec.version}",
    'source_code_uri'       => 'https://github.com/ioki-mobility/ioki-ruby',
    'bug_tracker_uri'       => 'https://github.com/ioki-mobility/ioki-ruby/issues',
    'rubygems_mfa_required' => 'true'
  }

  spec.require_paths = ['lib']

  spec.add_dependency 'activemodel', '>= 6.0.0'
  spec.add_dependency 'activesupport', '>= 6.0.0'
  spec.add_dependency 'faraday', '>= 1.8', '< 3.0'
  spec.add_dependency 'faraday-retry', '~> 2.2'
  spec.add_dependency 'oauth2', '>= 2.0.2', '< 3'
  spec.add_dependency 'openssl', '>= 2.2.0'
end
