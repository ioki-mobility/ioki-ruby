# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationMeasureSeries do
  subject(:measure_series) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:            'reporting/report_aggregation_measure_series',
      key:             'login_count',
      localized_label: 'Logins',
      points:          [10.0, nil],
      trend:           12.5
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:key).as(:string) }
  it { is_expected.to define_attribute(:localized_label).as(:string) }
  it { is_expected.to define_attribute(:points).as(:array) }
  it { is_expected.to define_attribute(:trend).as(:float) }

  it 'casts measure series metadata' do
    expect(measure_series.key).to eq('login_count')
    expect(measure_series.localized_label).to eq('Logins')
    expect(measure_series.points).to eq([10.0, nil])
    expect(measure_series.trend).to eq(12.5)
  end

  it 'accepts nullable trends' do
    expect(described_class.new(attributes.merge(trend: nil)).trend).to be_nil
  end
end
