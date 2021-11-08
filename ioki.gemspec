# frozen_string_literal: true

require_relative 'lib/ioki/version'

Gem::Specification.new do |spec|
  spec.name          = 'ioki'
  spec.version       = Ioki::VERSION
  spec.authors       = ['IOKI']
  spec.email         = ['info@ioki.com']

  spec.summary       = <<-SUMMARY
    The ioki Gem provides a rubyesque way of accessing the ioki Rest APIs.
  SUMMARY

  spec.description = <<-DESCRIPTION
    This Gem is under massive development. It currently provides access to a few endpoints within the ioki Platform API.
    It is partly inspired by octokit.
  DESCRIPTION

  spec.homepage = 'https://github.com/ioki-mobility/ioki'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.2')

  spec.metadata = {
    'homepage_uri'    => spec.homepage,
    'changelog_uri'   => "https://github.com/ioki-mobility/ioki/releases/tag/v#{spec.version}",
    'source_code_uri' => 'https://github.com/ioki-mobility/ioki',
    'bug_tracker_uri' => 'https://github.com/ioki-mobility/ioki/issues'
  }

  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 1.4'
end
