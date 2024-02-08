# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::RematchingAttemptResult do
  it { is_expected.to define_attribute(:ride_id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:cancellation_done).as(:boolean) }
  it { is_expected.to define_attribute(:new_task_list_id).as(:string) }
  it { is_expected.to define_attribute(:old_task_list_id).as(:string) }
  it { is_expected.to define_attribute(:preserved_time).as(:boolean) }
  it { is_expected.to define_attribute(:success).as(:boolean) }
  it { is_expected.to define_attribute(:tried_to_cancel).as(:boolean) }
end
