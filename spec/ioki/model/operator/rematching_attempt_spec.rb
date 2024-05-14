# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::RematchingAttempt do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }
  it { is_expected.to define_attribute(:auto_cancel_empty_task_list).as(:boolean) }
  it { is_expected.to define_attribute(:auto_cancel_failed_rematchings).as(:boolean) }
  it { is_expected.to define_attribute(:finished_at).as(:date_time) }
  it { is_expected.to define_attribute(:preserve_negotiated_times).as(:boolean) }
  it { is_expected.to define_attribute(:reassigner_id).as(:string) }
  it { is_expected.to define_attribute(:reassigner_type).as(:string) }
  it { is_expected.to define_attribute(:results).as(:array).with(class_name: 'RematchingAttemptResult') }
  it { is_expected.to define_attribute(:ride_ids).as(:array) }
  it { is_expected.to define_attribute(:started_at).as(:date_time) }
  it { is_expected.to define_attribute(:task_list_id).as(:string) }
  it { is_expected.to define_attribute(:whitelisted_task_list_ids).as(:array) }
end
