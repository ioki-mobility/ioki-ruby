# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationMeasureTotal do
  subject(:measure_total) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:                   'reporting/report_aggregation_measure_total',
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
      value:                  30.0
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

  it { is_expected.to define_attribute(:value).as(:float) }

  it 'casts total measure metadata' do
    expect(measure_total.measure_name).to eq('login_count')
    expect(measure_total.localized_measure_name).to eq('Logins')
    expect(measure_total.format_type).to eq('distance')
    expect(measure_total.format_unit).to eq('kilometer')
    expect(measure_total.dimensions).to all(be_a(Ioki::Model::Operator::Reporting::ReportAggregationDimension))
    expect(measure_total.dimensions.map(&:name)).to eq(%w[uses_otp ride_distance])
    expect(measure_total.dimensions.first.localized_value).to eq('Yes')
    expect(measure_total.dimensions.last.dimension_type).to eq('numeric')
    expect(measure_total.dimensions.last.from).to eq(1.0)
    expect(measure_total.dimensions.last.to).to eq(5.0)
    expect(measure_total.value).to eq(30.0)
  end

  it 'accepts nullable values' do
    expect(described_class.new(attributes.merge(value: nil)).value).to be_nil
  end
end
