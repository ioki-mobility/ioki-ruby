# frozen_string_literal: true

RSpec.describe Ioki::Model::Webhooks::VehiclePositionWithoutVehicle do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }

  it { is_expected.to define_attribute(:accuracy).as(:float) }
  it { is_expected.to define_attribute(:altitude).as(:float) }
  it { is_expected.to define_attribute(:altitude_accuracy).as(:float) }
  it { is_expected.to define_attribute(:heading).as(:float) }
  it { is_expected.to define_attribute(:lat).as(:float) }
  it { is_expected.to define_attribute(:lng).as(:float) }
  it { is_expected.to define_attribute(:product_id).as(:string) }
  it { is_expected.to define_attribute(:recorded_at).as(:date_time) }
  it { is_expected.to define_attribute(:speed).as(:float) }
end
