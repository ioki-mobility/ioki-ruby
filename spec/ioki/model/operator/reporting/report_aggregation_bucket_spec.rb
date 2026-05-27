# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationBucket do
  subject(:bucket) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:                    'reporting/report_aggregation_bucket',
      granularities:           %w[hour day week month],
      localized_granularities: %w[Hourly Daily Weekly Monthly],
      presets:                 %w[last_7_days last_28_days last_6_months last_12_months month_to_date],
      localized_presets:       ['Last 7 days', 'Last 28 days', 'Last 6 months', 'Last 12 months', 'Month to date'],
      default_preset:          'last_7_days'
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:granularities).as(:array) }
  it { is_expected.to define_attribute(:localized_granularities).as(:array) }
  it { is_expected.to define_attribute(:presets).as(:array) }
  it { is_expected.to define_attribute(:localized_presets).as(:array) }
  it { is_expected.to define_attribute(:default_preset).as(:string) }

  it 'casts all bucket metadata' do
    expect(bucket.granularities).to eq(%w[hour day week month])
    expect(bucket.localized_granularities).to eq(%w[Hourly Daily Weekly Monthly])
    expect(bucket.presets).to eq(%w[last_7_days last_28_days last_6_months last_12_months month_to_date])
    expect(bucket.localized_presets).to eq(
      ['Last 7 days', 'Last 28 days', 'Last 6 months', 'Last 12 months', 'Month to date']
    )
    expect(bucket.default_preset).to eq('last_7_days')
  end

  it 'accepts a nullable default preset' do
    expect(described_class.new(attributes.merge(default_preset: nil)).default_preset).to be_nil
  end
end
