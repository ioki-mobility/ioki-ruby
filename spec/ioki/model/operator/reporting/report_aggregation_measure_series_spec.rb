# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationMeasureSeries do
  subject(:measure_series) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:                   'reporting/report_aggregation_measure_series',
      measure_name:           'login_count',
      localized_measure_name: 'Logins',
      format_type:            'distance',
      format_unit:            'kilometer',
      dimensions:             [
        {
          type:            'reporting/report_aggregation_dimension',
          dimension_type:  'enum',
          name:            'uses_otp',
          localized_name:  'Uses OTP',
          value:           'true',
          localized_value: 'Yes',
          from:            nil,
          to:              nil
        },
        {
          type:            'reporting/report_aggregation_dimension',
          dimension_type:  'numeric',
          name:            'ride_distance',
          localized_name:  'Ride distance',
          value:           '1_5',
          localized_value: '1-5 km',
          from:            1.0,
          to:              5.0
        }
      ],
      points:                 [10.0, nil]
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:measure_name).as(:string) }
  it { is_expected.to define_attribute(:localized_measure_name).as(:string) }
  it { is_expected.to define_attribute(:format_type).as(:string) }
  it { is_expected.to define_attribute(:format_unit).as(:string) }

  it do
    is_expected.to define_attribute(:dimensions).as(:array).with(class_name: 'ReportAggregationDimension')
  end

  it { is_expected.to define_attribute(:points).as(:array) }

  it 'casts measure series metadata' do
    expect(measure_series.measure_name).to eq('login_count')
    expect(measure_series.localized_measure_name).to eq('Logins')
    expect(measure_series.format_type).to eq('distance')
    expect(measure_series.format_unit).to eq('kilometer')
    expect(measure_series.dimensions).to all(be_a(Ioki::Model::Operator::Reporting::ReportAggregationDimension))
    expect(measure_series.dimensions.map(&:name)).to eq(%w[uses_otp ride_distance])
    expect(measure_series.dimensions.first.localized_value).to eq('Yes')
    expect(measure_series.dimensions.last.dimension_type).to eq('numeric')
    expect(measure_series.dimensions.last.from).to eq(1.0)
    expect(measure_series.dimensions.last.to).to eq(5.0)
    expect(measure_series.points).to eq([10.0, nil])
  end
end
