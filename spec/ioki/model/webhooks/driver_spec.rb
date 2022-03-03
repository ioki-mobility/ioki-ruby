# frozen_string_literal: true

RSpec.describe Ioki::Model::Webhooks::Driver do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:username).as(:string) }
  it { is_expected.to define_attribute(:first_name).as(:string) }
  it { is_expected.to define_attribute(:last_name).as(:string) }
  it { is_expected.to define_attribute(:phone_number).as(:string) }
  it { is_expected.to define_attribute(:product_id).as(:string) }
  it { is_expected.to define_attribute(:connected_vehicle).as(:object).with(class_name: 'NestedVehicle') }
end
