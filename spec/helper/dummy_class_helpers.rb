module Dummys
end

module DummyClassHelpers
  def dummy_class(name, module_name, superclass = Object, &block)
    let(name.to_s) do
      klass = Class.new(superclass, &block)

      module_name.const_set (name.to_s + SecureRandom.hex(5)).split('_').collect!(&:capitalize).join, klass
    end
  end
end

RSpec.configure do |c|
  c.extend DummyClassHelpers
end
