# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationMeasure do
  subject(:measure) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:               'reporting/report_aggregation_measure',
      name:               'login_count',
      function:           'count_rows',
      localized_function: 'Count',
      localized_label:    'Logins',
      localized_type:     'Count',
      value_type:         'number'
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:function).as(:string) }
  it { is_expected.to define_attribute(:localized_function).as(:string) }
  it { is_expected.to define_attribute(:localized_label).as(:string) }
  it { is_expected.to define_attribute(:localized_type).as(:string) }
  it { is_expected.to define_attribute(:value_type).as(:string) }

  it 'casts measure metadata' do
    expect(measure.name).to eq('login_count')
    expect(measure.function).to eq('count_rows')
    expect(measure.localized_function).to eq('Count')
    expect(measure.localized_label).to eq('Logins')
    expect(measure.localized_type).to eq('Count')
    expect(measure.value_type).to eq('number')
  end
end
