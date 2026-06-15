# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationMeasureTotal do
  subject(:measure_total) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:                      'reporting/report_aggregation_measure_total',
      measure_name:              'login_count',
      localized_measure_name:    'Logins',
      dimension_name:            'uses_otp',
      localized_dimension_name:  'Uses OTP',
      dimension_value:           'true',
      localized_dimension_value: 'Yes',
      value:                     30.0
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:measure_name).as(:string) }
  it { is_expected.to define_attribute(:localized_measure_name).as(:string) }
  it { is_expected.to define_attribute(:dimension_name).as(:string) }
  it { is_expected.to define_attribute(:localized_dimension_name).as(:string) }
  it { is_expected.to define_attribute(:dimension_value).as(:string) }
  it { is_expected.to define_attribute(:localized_dimension_value).as(:string) }
  it { is_expected.to define_attribute(:value).as(:float) }

  it 'casts total measure metadata' do
    expect(measure_total.measure_name).to eq('login_count')
    expect(measure_total.localized_measure_name).to eq('Logins')
    expect(measure_total.dimension_name).to eq('uses_otp')
    expect(measure_total.localized_dimension_name).to eq('Uses OTP')
    expect(measure_total.dimension_value).to eq('true')
    expect(measure_total.localized_dimension_value).to eq('Yes')
    expect(measure_total.value).to eq(30.0)
  end

  it 'accepts nullable values' do
    expect(described_class.new(attributes.merge(value: nil)).value).to be_nil
  end
end
