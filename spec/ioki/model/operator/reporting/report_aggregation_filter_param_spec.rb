# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationFilterParam do
  subject(:filter_param) { described_class.new(name: 'booking_type', values: %w[prebooked adhoc]) }

  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:values).as(:array) }

  it 'serializes filter params for aggregation queries' do
    expect(filter_param.serialize(:create)).to eq(
      name:   'booking_type',
      values: %w[prebooked adhoc]
    )
  end
end
