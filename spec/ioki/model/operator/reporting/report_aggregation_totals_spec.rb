# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationTotals do
  subject(:totals) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:                       'reporting/report_aggregation_totals',
      aggregation_name:           'admin_logins',
      localized_aggregation_name: 'Admin logins',
      measures:                   [
        {
          type:                      'reporting/report_aggregation_measure_total',
          measure_name:              'login_count',
          localized_measure_name:    'Logins',
          dimension_name:            nil,
          localized_dimension_name:  nil,
          dimension_value:           nil,
          localized_dimension_value: nil,
          value:                     30.0
        }
      ]
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:aggregation_name).as(:string) }
  it { is_expected.to define_attribute(:localized_aggregation_name).as(:string) }
  it { is_expected.to define_attribute(:measures).as(:array).with(class_name: 'ReportAggregationMeasureTotal') }

  it 'casts measure totals into reporting models' do
    expect(totals.aggregation_name).to eq('admin_logins')
    expect(totals.localized_aggregation_name).to eq('Admin logins')
    expect(totals.measures.first).to be_a(Ioki::Model::Operator::Reporting::ReportAggregationMeasureTotal)
    expect(totals.measures.first.localized_measure_name).to eq('Logins')
    expect(totals.measures.first.value).to eq(30.0)
  end

  it 'accepts nullable total values' do
    totals_with_nil_value = described_class.new(
      attributes.merge(measures: [attributes[:measures].first.merge(value: nil)])
    )

    expect(totals_with_nil_value.measures.first.value).to be_nil
  end
end
