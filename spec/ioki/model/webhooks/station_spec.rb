# frozen_string_literal: true

RSpec.describe Ioki::Model::Webhooks::Station do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:active).as(:boolean) }
  it { is_expected.to define_attribute(:city).as(:string) }
  it { is_expected.to define_attribute(:country).as(:string) }
  it { is_expected.to define_attribute(:county).as(:string) }
  it { is_expected.to define_attribute(:description).as(:string) }
  it { is_expected.to define_attribute(:external_id).as(:string) }
  it { is_expected.to define_attribute(:lat).as(:float) }
  it { is_expected.to define_attribute(:lng).as(:float) }
  it { is_expected.to define_attribute(:location_name).as(:string) }
  it { is_expected.to define_attribute(:postal_code).as(:string) }
  it { is_expected.to define_attribute(:station_type).as(:string) }
  it { is_expected.to define_attribute(:street_name).as(:string) }
  it { is_expected.to define_attribute(:street_number).as(:string) }
  it { is_expected.to define_attribute(:deactivations).as(:array).with(class_name: 'Deactivation') }
end
