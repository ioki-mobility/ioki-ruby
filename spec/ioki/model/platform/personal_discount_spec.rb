# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::PersonalDiscount do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:absolute_discount_object).as(:object).with(class_name: 'Money') }
  it { is_expected.to define_attribute(:channel).as(:string) }
  it { is_expected.to define_attribute(:consumed).as(:boolean) }
  it { is_expected.to define_attribute(:description).as(:string) }
  it { is_expected.to define_attribute(:discount_type).as(:string) }
  it { is_expected.to define_attribute(:maximum_usages).as(:integer) }
  it { is_expected.to define_attribute(:payment_method).as(:object).with(class_name: 'PaymentMethod') }
  it { is_expected.to define_attribute(:product_id).as(:string) }
  it { is_expected.to define_attribute(:receipts).as(:array).with(class_name: 'Receipt') }
  it { is_expected.to define_attribute(:relative_discount).as(:integer) }
  it { is_expected.to define_attribute(:title).as(:string) }
  it { is_expected.to define_attribute(:usages).as(:integer) }
  it { is_expected.to define_attribute(:user_id).as(:string) }
  it { is_expected.to define_attribute(:valid_from).as(:date_time) }
  it { is_expected.to define_attribute(:valid_until).as(:date_time) }
  it { is_expected.to define_attribute(:validity).as(:string) }
end
