# frozen_string_literal: true

require 'ioki/model/base'
require 'ioki/model/platform/base'
require 'ioki/model/passenger/base'
require 'ioki/model/driver/base'

Dir[File.join(__dir__, 'model', 'platform', '*')].reject { |filename| filename == File.join(__dir__, 'model', 'platform', 'base.rb') }.sort.each { |file| require file }
Dir[File.join(__dir__, 'model', 'passenger', '*')].reject { |filename| filename == File.join(__dir__, 'model', 'passenger', 'base.rb') }.sort.each { |file| require file }
Dir[File.join(__dir__, 'model', 'driver', '*')].reject { |filename| filename == File.join(__dir__, 'model', 'driver', 'base.rb') }.sort.each { |file| require file }

module Ioki
  module Model
  end
end
