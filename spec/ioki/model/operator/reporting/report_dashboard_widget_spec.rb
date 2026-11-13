# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportDashboardWidget do
  it { is_expected.to define_attribute(:visualization).as(:string) }
  it { is_expected.to define_attribute(:highlighted).as(:boolean) }
  it { is_expected.to define_attribute(:columns).as(:integer) }
  it { is_expected.to define_attribute(:measure).as(:object).with(class_name: 'ReportAggregationMeasure') }

  it 'casts the highlighted flag' do
    expect(described_class.new(highlighted: true).highlighted).to be(true)
    expect(described_class.new(highlighted: false).highlighted).to be(false)
  end

  it 'casts the columns' do
    expect(described_class.new(columns: 2).columns).to eq(2)
  end

  it 'casts the measure' do
    widget = described_class.new(measure: { name: 'login_count', format_type: 'number', dimensions: [] })

    expect(widget.measure).to be_a(Ioki::Model::Operator::Reporting::ReportAggregationMeasure)
    expect(widget.measure.name).to eq('login_count')
  end
end
