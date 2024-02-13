# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::ResourceConfiguration do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:bicycle_racks).as(:integer) }
  it { is_expected.to define_attribute(:child_booster_seat).as(:integer) }
  it { is_expected.to define_attribute(:child_safety_seat).as(:integer) }
  it { is_expected.to define_attribute(:default).as(:boolean) }
  it { is_expected.to define_attribute(:hand_luggage_storage_spaces).as(:integer) }
  it { is_expected.to define_attribute(:medical_seats).as(:integer) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:pet_transportation_bays).as(:integer) }
  it { is_expected.to define_attribute(:power_plugs).as(:integer) }
  it { is_expected.to define_attribute(:resource_1).as(:integer) }
  it { is_expected.to define_attribute(:resource_2).as(:integer) }
  it { is_expected.to define_attribute(:resource_3).as(:integer) }
  it { is_expected.to define_attribute(:resource_4).as(:integer) }
  it { is_expected.to define_attribute(:resource_5).as(:integer) }
  it { is_expected.to define_attribute(:seats).as(:integer) }
  it { is_expected.to define_attribute(:special_seats).as(:integer) }
  it { is_expected.to define_attribute(:storage_spaces).as(:integer) }
  it { is_expected.to define_attribute(:suitcase_storage_spaces).as(:integer) }
  it { is_expected.to define_attribute(:walker_bays).as(:integer) }
  it { is_expected.to define_attribute(:walker_storage_spaces).as(:integer) }
  it { is_expected.to define_attribute(:wheelchair_bays).as(:integer) }
  it { is_expected.to define_attribute(:wheelchair_storage_spaces).as(:integer) }
  it { is_expected.to define_attribute(:wlan_access_points).as(:integer) }
end
