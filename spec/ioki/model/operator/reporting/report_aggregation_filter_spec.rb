# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationFilter do
  subject(:filter) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:             'reporting/report_aggregation_filter',
      name:             'operator_id',
      localized_label:  'Operator',
      values:           %w[op-1 op-2],
      localized_values: %w[Op-1 Op-2]
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:localized_label).as(:string) }
  it { is_expected.to define_attribute(:values).as(:array) }
  it { is_expected.to define_attribute(:localized_values).as(:array) }

  it 'casts filter metadata' do
    expect(filter.name).to eq('operator_id')
    expect(filter.localized_label).to eq('Operator')
    expect(filter.values).to eq(%w[op-1 op-2])
    expect(filter.localized_values).to eq(%w[Op-1 Op-2])
  end

  it 'accepts unrestricted filter values' do
    unrestricted_filter = described_class.new(attributes.merge(values: nil, localized_values: nil))

    expect(unrestricted_filter.values).to be_nil
    expect(unrestricted_filter.localized_values).to be_nil
  end
end
