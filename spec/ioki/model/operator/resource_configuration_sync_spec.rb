# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::ResourceConfigurationSync do
    it { is_expected.to define_attribute(:vehicle_ids).as(:array) }
end
