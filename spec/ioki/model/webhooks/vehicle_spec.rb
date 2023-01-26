# frozen_string_literal: true

RSpec.describe Ioki::Model::Webhooks::Vehicle do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:autonomous).as(:boolean) }
  it { is_expected.to define_attribute(:connected_driver).as(:object).with(class_name: 'NestedDriver') }
  it { is_expected.to define_attribute(:description).as(:string) }
  it { is_expected.to define_attribute(:external_id).as(:string) }
  it { is_expected.to define_attribute(:fuel_type).as(:string) }
  it { is_expected.to define_attribute(:last_known_position).as(:object) }
  it { is_expected.to define_attribute(:last_known_position).with(class_name: 'VehiclePositionWithoutVehicle') }
  it { is_expected.to define_attribute(:license_plate).as(:string) }
  it { is_expected.to define_attribute(:manufacturer).as(:string) }
  it { is_expected.to define_attribute(:model).as(:string) }
  it { is_expected.to define_attribute(:nickname).as(:string) }
  it { is_expected.to define_attribute(:phone_number).as(:string) }
  it { is_expected.to define_attribute(:product_id).as(:string) }
  it { is_expected.to define_attribute(:seats).as(:integer) }
end
