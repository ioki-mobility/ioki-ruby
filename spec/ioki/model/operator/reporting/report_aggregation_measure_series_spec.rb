# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationMeasureSeries do
  subject(:measure_series) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:                      'reporting/report_aggregation_measure_series',
      measure_name:              'login_count',
      localized_measure_name:    'Logins',
      dimension_name:            'uses_otp',
      localized_dimension_name:  'Uses OTP',
      dimension_value:           'true',
      localized_dimension_value: 'Yes',
      points:                    [10.0, nil]
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:measure_name).as(:string) }
  it { is_expected.to define_attribute(:localized_measure_name).as(:string) }
  it { is_expected.to define_attribute(:dimension_name).as(:string) }
  it { is_expected.to define_attribute(:localized_dimension_name).as(:string) }
  it { is_expected.to define_attribute(:dimension_value).as(:string) }
  it { is_expected.to define_attribute(:localized_dimension_value).as(:string) }
  it { is_expected.to define_attribute(:points).as(:array) }

  it 'casts measure series metadata' do
    expect(measure_series.measure_name).to eq('login_count')
    expect(measure_series.localized_measure_name).to eq('Logins')
    expect(measure_series.dimension_name).to eq('uses_otp')
    expect(measure_series.localized_dimension_name).to eq('Uses OTP')
    expect(measure_series.dimension_value).to eq('true')
    expect(measure_series.localized_dimension_value).to eq('Yes')
    expect(measure_series.points).to eq([10.0, nil])
  end
end
