# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

Rake.add_rakelib 'lib/tasks'

task default: :spec

task :console do
  require 'irb'
  require 'irb/completion'
  require 'awesome_print'
  require 'debug'
  require 'ioki'

  def reload!
    original_warn_level = $VERBOSE
    $VERBOSE = nil

    files = $LOADED_FEATURES.grep(%r{/ioki/})

    files.each { |file| load file }
  ensure
    $VERBOSE = original_warn_level
  end

  ARGV.clear
  IRB.start
end

task c: :console
