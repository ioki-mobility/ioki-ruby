# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class EligibilityGroupMembershipManuallyAssignByEmailAddress < Base
        attribute :email_address,
                  on:   :create,
                  type: :string

        attribute :user_segment_slug,
                  on:   :create,
                  type: :string

        attribute :eligibility_group_slug,
                  on:   :create,
                  type: :string
      end
    end
  end
end
