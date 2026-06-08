# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationMeasureTotal do
  subject(:measure_total) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:            'reporting/report_aggregation_measure_total',
      key:             'login_count',
      localized_label: 'Logins',
      value:           30.0
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:key).as(:string) }
  it { is_expected.to define_attribute(:localized_label).as(:string) }
  it { is_expected.to define_attribute(:value).as(:float) }

  it 'casts total measure metadata' do
    expect(measure_total.key).to eq('login_count')
    expect(measure_total.localized_label).to eq('Logins')
    expect(measure_total.value).to eq(30.0)
  end

  it 'accepts nullable values' do
    expect(described_class.new(attributes.merge(value: nil)).value).to be_nil
  end
end
