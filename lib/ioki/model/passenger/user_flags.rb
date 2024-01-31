# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class UserFlags < Base
        attribute :version, on: :create, type: :integer
        attribute :terms_accepted, on: :create, type: :boolean, omit_if_nil_on: :create
        attribute :minimum_age_confirmed, on: :create, type: :boolean, omit_if_nil_on: :create
        attribute :analytics_tracking, on: :create, type: :boolean, omit_if_nil_on: :create
      end
    end
  end
end
