# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class PhoneCall < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :call_to_caller_sid,
                  on:   :read,
                  type: :string

        attribute :call_to_caller_status,
                  on:   :read,
                  type: :string

        attribute :call_to_caller_completed_at,
                  on:   :read,
                  type: :date_time

        attribute :call_to_callee_sid,
                  on:   :read,
                  type: :string

        attribute :call_to_callee_status,
                  on:   :read,
                  type: :string

        attribute :call_to_callee_completed_at,
                  on:   :read,
                  type: :date_time

        attribute :from_id,
                  on:   :read,
                  type: :string

        attribute :to_id,
                  on:   :read,
                  type: :string
      end
    end
  end
end
