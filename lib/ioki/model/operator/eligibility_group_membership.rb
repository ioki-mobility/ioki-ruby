# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class EligibilityGroupMembership < Base
        attribute :id,
                  on:   :read,
                  type: :string

        attribute :type,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :user_id,
                  on:   :read,
                  type: :string

        attribute :eligibility_group_slug,
                  on:   :read,
                  type: :string

        attribute :state,
                  on:   :read,
                  type: :string

        attribute :active_strategies,
                  on:   :read,
                  type: :array

        attribute :activated_at,
                  on:   :read,
                  type: :date_time
      end
    end
  end
end
