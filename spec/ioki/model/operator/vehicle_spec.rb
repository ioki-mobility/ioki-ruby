# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Vehicle do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:version).as(:integer) }
  it { is_expected.to define_attribute(:active).as(:boolean) }
  it { is_expected.to define_attribute(:autonomous).as(:boolean) }
  it { is_expected.to define_attribute(:connected_driver_id).as(:string) }

  it {
    is_expected.to define_attribute(:default_resource_configuration).as(:object)
      .with(class_name: 'ResourceConfiguration')
  }

  it { is_expected.to define_attribute(:description).as(:string) }
  it { is_expected.to define_attribute(:external_id).as(:string) }
  it { is_expected.to define_attribute(:fuel_type).as(:string) }
  it { is_expected.to define_attribute(:image).as(:object).with(class_name: 'ImageUpload') }
  it { is_expected.to define_attribute(:last_known_position).as(:object).with(class_name: 'VehiclePosition') }
  it { is_expected.to define_attribute(:last_position).as(:object).with(class_name: 'VehiclePosition') }
  it { is_expected.to define_attribute(:license_plate).as(:string) }
  it { is_expected.to define_attribute(:manufacturer).as(:string) }
  it { is_expected.to define_attribute(:matching_rank).as(:integer) }
  it { is_expected.to define_attribute(:model).as(:string) }
  it { is_expected.to define_attribute(:nickname).as(:string) }
  it { is_expected.to define_attribute(:num_wheelchair_bays_as_storages).as(:integer) }
  it { is_expected.to define_attribute(:operator_id).as(:string) }
  it { is_expected.to define_attribute(:phone_number).as(:string) }
  it { is_expected.to define_attribute(:telemetry).as(:object).with(class_name: 'Telemetry') }
  it { is_expected.to define_attribute(:custom_flags).as(:array).with(class_name: 'CustomFlag') }
end
