# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::Line do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:mode).as(:string) }
  it { is_expected.to define_attribute(:route_number).as(:string) }
  it { is_expected.to define_attribute(:skip_time_window_check).as(:boolean) }
  it { is_expected.to define_attribute(:slug).as(:string) }
  it { is_expected.to define_attribute(:variant).as(:string) }
  it { is_expected.to define_attribute(:line_stops).as(:array).with(class_name: 'LineStop') }
end
