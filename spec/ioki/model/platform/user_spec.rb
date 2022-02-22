# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::User do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:email).as(:object).with(class_name: 'UserEmail') }
  it { is_expected.to define_attribute(:external_id).as(:string) }
  it { is_expected.to define_attribute(:first_name).as(:string) }
  it { is_expected.to define_attribute(:last_name).as(:string) }
  it { is_expected.to define_attribute(:locale).as(:string) }
  it { is_expected.to define_attribute(:lock_reason).as(:string) }
  it { is_expected.to define_attribute(:lock_type).as(:string) }
  it { is_expected.to define_attribute(:locked_at).as(:date_time) }
  it { is_expected.to define_attribute(:phone_number).as(:string) }
  it { is_expected.to define_attribute(:provider_id).as(:string).with(on: :read) }
  it { is_expected.to define_attribute(:terms_accepted_at).as(:date_time) }
  it { is_expected.to define_attribute(:terms_accepted).as(:boolean) }
  it { is_expected.to define_attribute(:version).as(:integer) }
end
