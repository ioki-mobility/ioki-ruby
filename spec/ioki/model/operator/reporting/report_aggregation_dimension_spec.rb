# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationDimension do
  subject(:measure_dimension) { described_class.new(attributes) }

  let(:attributes) do
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
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:dimension_type).as(:string) }
  it { is_expected.to define_attribute(:from).as(:float) }
  it { is_expected.to define_attribute(:localized_name).as(:string) }
  it { is_expected.to define_attribute(:localized_value).as(:string) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:to).as(:float) }
  it { is_expected.to define_attribute(:value).as(:string) }

  it 'casts measure dimension attributes' do
    expect(measure_dimension.dimension_type).to eq('numeric')
    expect(measure_dimension.name).to eq('ride_distance')
    expect(measure_dimension.localized_name).to eq('Ride distance')
    expect(measure_dimension.value).to eq('1_5')
    expect(measure_dimension.localized_value).to eq('1-5 km')
    expect(measure_dimension.from).to eq(1.0)
    expect(measure_dimension.to).to eq(5.0)
  end

  it 'accepts unbounded bounds for enum dimensions' do
    enum_dimension = described_class.new(attributes.merge(dimension_type: 'enum', from: nil, to: nil))

    expect(enum_dimension.from).to be_nil
    expect(enum_dimension.to).to be_nil
  end
end
