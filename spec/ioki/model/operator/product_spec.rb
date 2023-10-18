# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Product do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:version).as(:integer) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:provider).as(:object).with(class_name: 'Provider') }
  it { is_expected.to define_attribute(:area).as(:object).with(class_name: 'Geojson') }
  it { is_expected.to define_attribute(:ad_hoc_bookable).as(:boolean) }
  it { is_expected.to define_attribute(:boarding_time).as(:integer) }
  it { is_expected.to define_attribute(:bounding_box).as(:object).with(class_name: 'BoundingBox') }
  it { is_expected.to define_attribute(:default_end_place_id).as(:string) }

  it {
    is_expected.to define_attribute(:default_matching_configuration).as(:object)
      .with(class_name: 'MatchingConfiguration')
  }

  it { is_expected.to define_attribute(:default_service_duration).as(:integer) }
  it { is_expected.to define_attribute(:default_service_start).as(:integer) }
  it { is_expected.to define_attribute(:default_start_place_id).as(:string) }
  it { is_expected.to define_attribute(:description).as(:string) }
  it { is_expected.to define_attribute(:disable_station_markers).as(:boolean) }
  it { is_expected.to define_attribute(:features).as(:object).with(class_name: 'Features') }
  it { is_expected.to define_attribute(:fixed_stations).as(:array).with(class_name: 'Station') }
  it { is_expected.to define_attribute(:matching_configurations).as(:array).with(class_name: 'MatchingConfiguration') }
  it { is_expected.to define_attribute(:parking_time).as(:integer) }
  it { is_expected.to define_attribute(:prebookable).as(:boolean) }
  it { is_expected.to define_attribute(:ride_options).as(:object).with(class_name: 'RideOptions') }
  it { is_expected.to define_attribute(:ride_rating_criteria).as(:array) }
  it { is_expected.to define_attribute(:service_time_info).as(:string) }
  it { is_expected.to define_attribute(:state).as(:string) }
  it { is_expected.to define_attribute(:timezone).as(:object).with(class_name: 'Timezone') }
  it { is_expected.to define_attribute(:walker_boarding_time).as(:integer) }
  it { is_expected.to define_attribute(:wheelchair_boarding_time).as(:integer) }
end
