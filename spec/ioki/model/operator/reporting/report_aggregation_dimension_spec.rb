# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationDimension do
  subject(:dimension) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:             'reporting/report_aggregation_dimension',
      name:             'booking_type',
      localized_name:   'Booking type',
      values:           %w[prebooked adhoc],
      localized_values: ['Prebooked', 'Ad hoc']
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:localized_name).as(:string) }
  it { is_expected.to define_attribute(:values).as(:array) }
  it { is_expected.to define_attribute(:localized_values).as(:array) }

  it 'casts dimension metadata' do
    expect(dimension.name).to eq('booking_type')
    expect(dimension.localized_name).to eq('Booking type')
    expect(dimension.values).to eq(%w[prebooked adhoc])
    expect(dimension.localized_values).to eq(['Prebooked', 'Ad hoc'])
  end

  it 'accepts unknown values metadata' do
    unknown_values_dimension = described_class.new(attributes.merge(values: nil, localized_values: nil))

    expect(unknown_values_dimension.values).to be_nil
    expect(unknown_values_dimension.localized_values).to be_nil
  end
end
