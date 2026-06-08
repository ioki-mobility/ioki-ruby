# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregation do
  subject(:report_aggregation) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:                    'reporting/report_aggregation',
      name:                    'admin_logins',
      visualization:           'bar',
      localized_visualization: 'Bar chart',
      release_stage:           'stable',
      bucket:                  {
        type:                    'reporting/report_aggregation_bucket',
        granularities:           ['day', 'week'],
        localized_granularities: ['Daily', 'Weekly'],
        presets:                 ['last_7_days'],
        localized_presets:       ['Last 7 days'],
        default_preset:          'last_7_days'
      },
      measures:                [
        {
          type:               'reporting/report_aggregation_measure',
          name:               'rides',
          function:           'count_rows',
          percentile:         nil,
          localized_function: 'Count',
          localized_label:    'Rides',
          localized_type:     'Count',
          value_type:         'number'
        }
      ],
      dimensions:              [
        {
          type:             'reporting/report_aggregation_dimension',
          name:             'booking_type',
          localized_label:  'Booking type',
          values:           ['prebooked', 'adhoc'],
          localized_values: ['Prebooked', 'Ad hoc']
        }
      ],
      filters:                 [
        {
          type:             'reporting/report_aggregation_filter',
          name:             'operator_id',
          localized_label:  'Operator',
          values:           ['operator_1'],
          localized_values: ['Operator 1']
        }
      ]
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:visualization).as(:string) }
  it { is_expected.to define_attribute(:localized_visualization).as(:string) }
  it { is_expected.to define_attribute(:release_stage).as(:string) }
  it { is_expected.to define_attribute(:bucket).as(:object).with(class_name: 'ReportAggregationBucket') }
  it { is_expected.to define_attribute(:measures).as(:array).with(class_name: 'ReportAggregationMeasure') }
  it { is_expected.to define_attribute(:dimensions).as(:array).with(class_name: 'ReportAggregationDimension') }
  it { is_expected.to define_attribute(:filters).as(:array).with(class_name: 'ReportAggregationFilter') }

  it 'casts nested aggregation data into reporting models' do
    expect(report_aggregation.name).to eq('admin_logins')
    expect(report_aggregation.visualization).to eq('bar')
    expect(report_aggregation.localized_visualization).to eq('Bar chart')
    expect(report_aggregation.release_stage).to eq('stable')
    expect(report_aggregation.bucket).to be_a(Ioki::Model::Operator::Reporting::ReportAggregationBucket)
    expect(report_aggregation.bucket.localized_granularities).to eq(['Daily', 'Weekly'])
    expect(report_aggregation.bucket.localized_presets).to eq(['Last 7 days'])
    expect(report_aggregation.measures.first).to be_a(
      Ioki::Model::Operator::Reporting::ReportAggregationMeasure
    )
    expect(report_aggregation.measures.first.value_type).to eq('number')
    expect(report_aggregation.measures.first.percentile).to be_nil
    expect(report_aggregation.measures.first.localized_label).to eq('Rides')
    expect(report_aggregation.dimensions.first).to be_a(
      Ioki::Model::Operator::Reporting::ReportAggregationDimension
    )
    expect(report_aggregation.dimensions.first.localized_values).to eq(['Prebooked', 'Ad hoc'])
    expect(report_aggregation.filters.first).to be_a(Ioki::Model::Operator::Reporting::ReportAggregationFilter)
    expect(report_aggregation.filters.first.localized_label).to eq('Operator')
  end

  it 'accepts nullable bucket and known values metadata' do
    aggregation = described_class.new(
      attributes.merge(
        bucket:     nil,
        dimensions: [
          {
            type:             'reporting/report_aggregation_dimension',
            name:             'booking_type',
            localized_label:  'Booking type',
            values:           nil,
            localized_values: nil
          }
        ],
        filters:    [
          {
            type:             'reporting/report_aggregation_filter',
            name:             'operator_id',
            localized_label:  'Operator',
            values:           nil,
            localized_values: nil
          }
        ]
      )
    )

    expect(aggregation.bucket).to be_nil
    expect(aggregation.dimensions.first.values).to be_nil
    expect(aggregation.dimensions.first.localized_values).to be_nil
    expect(aggregation.filters.first.values).to be_nil
    expect(aggregation.filters.first.localized_values).to be_nil
  end
end
