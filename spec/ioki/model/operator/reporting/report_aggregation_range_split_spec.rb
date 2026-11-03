# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationRangeSplit do
  subject(:range_split) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:   'reporting/report_aggregation_range_split',
      name:   'ride_distance',
      values: [
        { count: 4, from: nil, label: '< 1 km', to: 1.0 },
        { count: 7, from: 1.0, label: '>= 1 km', to: nil }
      ]
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:values).as(:array).with(class_name: 'ReportAggregationRangeSplitValue') }

  it 'casts range values into reporting models' do
    expect(range_split.name).to eq('ride_distance')
    expect(range_split.values).to all(be_a(Ioki::Model::Operator::Reporting::ReportAggregationRangeSplitValue))
    expect(range_split.values.map(&:count)).to eq([4, 7])
    expect(range_split.values.first.to).to eq(1.0)
    expect(range_split.values.last.from).to eq(1.0)
  end
end
