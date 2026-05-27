# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationResult do
  subject(:result) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:                  'reporting/report_aggregation_result',
      aggregation_name:      'admin_logins',
      visualization:         'bar',
      timezone_identifier:   'Europe/Berlin',
      buckets:               %w[2026-04-01 2026-04-02],
      bucket:                'day',
      measures:              [
        {
          type:            'reporting/report_aggregation_measure_series',
          key:             'login_count',
          localized_label: 'Logins',
          points:          [10.0, 20.0],
          trend:           nil
        }
      ],
      partitions_considered: 2,
      definition_versions:   [1]
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:aggregation_name).as(:string) }
  it { is_expected.to define_attribute(:visualization).as(:string) }
  it { is_expected.to define_attribute(:timezone_identifier).as(:string) }
  it { is_expected.to define_attribute(:buckets).as(:array) }
  it { is_expected.to define_attribute(:bucket).as(:string) }

  it do
    is_expected.to define_attribute(:measures).as(:array).with(class_name: 'ReportAggregationMeasureSeries')
  end

  it { is_expected.to define_attribute(:partitions_considered).as(:integer) }
  it { is_expected.to define_attribute(:definition_versions).as(:array) }

  it 'casts measure series into reporting models' do
    expect(result.aggregation_name).to eq('admin_logins')
    expect(result.visualization).to eq('bar')
    expect(result.timezone_identifier).to eq('Europe/Berlin')
    expect(result.buckets).to eq(%w[2026-04-01 2026-04-02])
    expect(result.bucket).to eq('day')
    expect(result.measures.first).to be_a(Ioki::Model::Operator::Reporting::ReportAggregationMeasureSeries)
    expect(result.measures.first.localized_label).to eq('Logins')
    expect(result.partitions_considered).to eq(2)
    expect(result.definition_versions).to eq([1])
  end

  it 'accepts nullable bucket metadata and measure trends' do
    aggregation_result = described_class.new(
      attributes.merge(
        bucket:   nil,
        measures: [attributes[:measures].first.merge(trend: 12.5)]
      )
    )

    expect(aggregation_result.bucket).to be_nil
    expect(aggregation_result.measures.first.trend).to eq(12.5)
  end
end
