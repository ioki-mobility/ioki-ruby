# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationSeries do
  subject(:series) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:                       'reporting/report_aggregation_series',
      aggregation_name:           'admin_logins',
      localized_aggregation_name: 'Admin logins',
      visualization:              'bar',
      timezone_identifier:        'Europe/Berlin',
      buckets:                    %w[2026-04-01 2026-04-02],
      bucket:                     'day',
      measures:                   [
        {
          type:                      'reporting/report_aggregation_measure_series',
          measure_name:              'login_count',
          localized_measure_name:    'Logins',
          dimension_name:            nil,
          localized_dimension_name:  nil,
          dimension_value:           nil,
          localized_dimension_value: nil,
          points:                    [10.0, 20.0]
        }
      ],
      partitions_considered:      2,
      definition_versions:        [1]
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:aggregation_name).as(:string) }
  it { is_expected.to define_attribute(:localized_aggregation_name).as(:string) }
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
    expect(series.aggregation_name).to eq('admin_logins')
    expect(series.localized_aggregation_name).to eq('Admin logins')
    expect(series.visualization).to eq('bar')
    expect(series.timezone_identifier).to eq('Europe/Berlin')
    expect(series.buckets).to eq(%w[2026-04-01 2026-04-02])
    expect(series.bucket).to eq('day')
    expect(series.measures.first).to be_a(Ioki::Model::Operator::Reporting::ReportAggregationMeasureSeries)
    expect(series.measures.first.localized_measure_name).to eq('Logins')
    expect(series.partitions_considered).to eq(2)
    expect(series.definition_versions).to eq([1])
  end

  it 'accepts nullable bucket metadata and dimension metadata' do
    aggregation_series = described_class.new(
      attributes.merge(
        bucket:   nil,
        measures: [attributes[:measures].first.merge(
          dimension_name:            'uses_otp',
          localized_dimension_name:  'Uses OTP',
          dimension_value:           'true',
          localized_dimension_value: 'Yes'
        )]
      )
    )

    expect(aggregation_series.bucket).to be_nil
    expect(aggregation_series.measures.first.dimension_name).to eq('uses_otp')
    expect(aggregation_series.measures.first.localized_dimension_value).to eq('Yes')
  end
end
