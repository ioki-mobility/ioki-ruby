# frozen_string_literal: true

RSpec.describe Ioki::Model::Driver::DriverRequestToken do
  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:created_at).as(:date_time) }
  it { is_expected.to define_attribute(:updated_at).as(:date_time) }

  it { is_expected.to define_attribute(:username).as(:string) }
  it { is_expected.to define_attribute(:pin).as(:string) }
  it { is_expected.to define_attribute(:password).as(:string) }
  it { is_expected.to define_attribute(:product_login_slug) }
  it { is_expected.to define_attribute(:token).as(:string) }
  it { is_expected.to define_attribute(:driver_id).as(:string) }
end
