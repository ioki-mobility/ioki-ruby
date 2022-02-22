# frozen_string_literal: true

require 'rspec/expectations'

# Usage:
#
# RSpec.describe Ioki::Model::Platform::User do
#   it { is_expected.to define_attribute(:id) }
#   it { is_expected.to define_attribute(:external_id).as(:string) }
#   it { is_expected.to define_attribute(:email).as(:object).with(class_name: 'UserEmail') }
# end

RSpec::Matchers.define :define_attribute do |expected_attribute_name|
  match do |actual_model|
    attribute_definitions = actual_model.class.attribute_definitions
    attribute_definitions.key?(expected_attribute_name) &&
      (
        @expected_attribute_type.nil? ||
        attribute_definitions[expected_attribute_name][:type] == @expected_attribute_type
      ) &&
      (
        @expected_hash.nil? || @expected_hash.all? do |key, value|
          attribute_definitions[expected_attribute_name][key] == value
        end
      )
  end

  chain :as do |expected_attribute_type|
    @expected_attribute_type = expected_attribute_type
  end

  chain :with do |expected_hash|
    @expected_hash = expected_hash
  end

  description do |_actual_model|
    "define :#{expected_attribute_name}" \
      + (@expected_attribute_type.nil? ? '' : " as a :#{@expected_attribute_type}") \
      + (@expected_hash.nil? ? '' : " with options '#{@expected_hash}'")
  end

  failure_message do |_actual_model|
    "does not define :#{expected_attribute_name}" \
      + (@expected_attribute_type.nil? ? '' : " as a :#{@expected_attribute_type}") \
      + (@expected_hash.nil? ? '' : " with options '#{@expected_hash}'")
  end
end
