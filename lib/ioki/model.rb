# frozen_string_literal: true

require 'ioki/model/base'
require 'ioki/model/driver/base'
require 'ioki/model/operator/base'
require 'ioki/model/passenger/base'
require 'ioki/model/platform/base'
require 'ioki/model/webhooks/base'

Dir[File.join(__dir__, 'model', 'platform', '*')].reject do |filename|
  filename == File.join(__dir__, 'model', 'platform', 'base.rb')
end.sort.each { |file| require file }
Dir[File.join(__dir__, 'model', 'passenger', '**', '*')].reject do |filename|
  filename == File.join(__dir__, 'model', 'passenger', 'base.rb') ||
    !File.file?(filename)
end.sort.each { |file| require file }
Dir[File.join(__dir__, 'model', 'driver', '*')].reject do |filename|
  filename == File.join(__dir__, 'model', 'driver', 'base.rb')
end.sort.each { |file| require file }
Dir[File.join(__dir__, 'model', 'operator', '**', '*')].reject do |filename|
  filename == File.join(__dir__, 'model', 'operator', 'base.rb') || File.directory?(filename)
end.sort.each { |file| require file }
Dir[File.join(__dir__, 'model', 'webhooks', '*')].reject do |filename|
  filename == File.join(__dir__, 'model', 'webhooks', 'base.rb')
end.sort.each { |file| require file }

module Ioki
  module Model
  end
end
