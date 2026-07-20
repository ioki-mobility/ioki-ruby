# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationMeasure do
  subject(:measure) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:               'reporting/report_aggregation_measure',
      name:               'login_count',
      localized_name:     'Logins',
      function:           'count_rows',
      percentile:         nil,
      localized_function: 'Count'
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:localized_name).as(:string) }
  it { is_expected.to define_attribute(:function).as(:string) }
  it { is_expected.to define_attribute(:percentile).as(:float) }
  it { is_expected.to define_attribute(:localized_function).as(:string) }
  it { is_expected.to define_attribute(:format_type).as(:string) }
  it { is_expected.to define_attribute(:localized_format_type).as(:string) }
  it { is_expected.to define_attribute(:format_unit).as(:string) }
  it { is_expected.to define_attribute(:localized_format_unit).as(:string) }

  it 'casts measure metadata' do
    expect(measure.name).to eq('login_count')
    expect(measure.localized_name).to eq('Logins')
    expect(measure.function).to eq('count_rows')
    expect(measure.percentile).to be_nil
    expect(measure.localized_function).to eq('Count')
  end

  it 'casts percentile values for percentile measures' do
    expect(described_class.new(attributes.merge(percentile: 0.95)).percentile).to eq(0.95)
  end
end
