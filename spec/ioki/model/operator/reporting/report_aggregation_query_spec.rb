# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Reporting::ReportAggregationQuery do
  let(:start_time) { DateTime.parse('2026-04-01T00:00:00Z') }
  let(:end_time) { DateTime.parse('2026-05-01T00:00:00Z') }

  it { is_expected.to define_attribute(:start_time).as(:date_time) }
  it { is_expected.to define_attribute(:end_time).as(:date_time) }
  it { is_expected.to define_attribute(:bucket).as(:string) }
  it { is_expected.to define_attribute(:filters).as(:array).with(class_name: 'ReportAggregationFilterParam') }

  it 'serializes the raw aggregation query payload' do
    query = described_class.new(
      start_time: start_time,
      end_time:   end_time,
      bucket:     'day',
      filters:    [
        Ioki::Model::Operator::Reporting::ReportAggregationFilterParam.new(
          name:   'booking_type',
          values: %w[prebooked adhoc]
        )
      ]
    )

    expect(query.serialize(:create)).to eq(
      start_time: start_time,
      end_time:   end_time,
      bucket:     'day',
      filters:    [
        {
          name:   'booking_type',
          values: %w[prebooked adhoc]
        }
      ]
    )
  end

  it 'omits optional attributes when they are not set' do
    query = described_class.new(start_time: start_time, end_time: end_time)

    expect(query.serialize(:create)).to eq(
      start_time: start_time,
      end_time:   end_time
    )
  end
end
