# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::RematchingSuggestion do
  it { is_expected.to define_attribute(:task_lists).as(:array).with(class_name: 'TaskList') }
end
