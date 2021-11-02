# frozen_string_literal: true

# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec, cmd: 'bundle exec rspec --format=documentation --tag focus' do
  # watch(%r{.*}) { |m| puts "Change detected on #{m.inspect}"; nil }

  # If a spec file changes - the file it self is run.
  # Usecase: You write specs and save it - you want this particular file to run
  watch(%r{^spec/.+_spec\.rb$})

  # If a file in the lib folder changes we want to run the corresponding test
  # under spec/  with the suffix "_spec.rb" to run
  watch(%r{^lib/(.+)\.rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  # if something in spec_helper.rb changes, we want to run the whole test suite
  watch('spec/spec_helper.rb') do
    'spec'
  end
end
