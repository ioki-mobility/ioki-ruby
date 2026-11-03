# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationRangeSplitValue do
  subject(:range_split_value) { described_class.new(attributes) }

  let(:attributes) do
    {
      count: 4,
      from:  1.0,
      label: '1-5 km',
      to:    5.0
    }
  end

  it { is_expected.to define_attribute(:count).as(:integer) }
  it { is_expected.to define_attribute(:from).as(:float) }
  it { is_expected.to define_attribute(:label).as(:string) }
  it { is_expected.to define_attribute(:to).as(:float) }

  it 'casts range value metadata' do
    expect(range_split_value.count).to eq(4)
    expect(range_split_value.from).to eq(1.0)
    expect(range_split_value.label).to eq('1-5 km')
    expect(range_split_value.to).to eq(5.0)
  end

  it 'accepts unbounded ranges and nullable labels' do
    unbounded = described_class.new(attributes.merge(from: nil, label: nil, to: nil))

    expect(unbounded.from).to be_nil
    expect(unbounded.label).to be_nil
    expect(unbounded.to).to be_nil
  end
end
