# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationSplit do
  subject(:split) { described_class.new(attributes) }

  let(:attributes) do
    {
      type:             'reporting/report_aggregation_split',
      dimension_type:   'enum',
      name:             'booking_type',
      localized_name:   'Booking type',
      values:           %w[prebooked adhoc],
      localized_values: ['Prebooked', 'Ad hoc'],
      thresholds:       nil
    }
  end

  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:dimension_type).as(:string) }
  it { is_expected.to define_attribute(:localized_name).as(:string) }
  it { is_expected.to define_attribute(:localized_values).as(:array) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:thresholds).as(:array) }
  it { is_expected.to define_attribute(:values).as(:array) }

  it 'casts enum split metadata' do
    expect(split.dimension_type).to eq('enum')
    expect(split.name).to eq('booking_type')
    expect(split.localized_name).to eq('Booking type')
    expect(split.values).to eq(%w[prebooked adhoc])
    expect(split.localized_values).to eq(['Prebooked', 'Ad hoc'])
    expect(split.thresholds).to be_nil
  end

  it 'casts numeric split metadata' do
    numeric_split = described_class.new(
      attributes.merge(
        dimension_type:   'numeric',
        name:             'delay_at_pickup',
        values:           nil,
        localized_values: nil,
        thresholds:       [300, 600]
      )
    )

    expect(numeric_split.dimension_type).to eq('numeric')
    expect(numeric_split.thresholds).to eq([300, 600])
    expect(numeric_split.values).to be_nil
    expect(numeric_split.localized_values).to be_nil
  end
end
