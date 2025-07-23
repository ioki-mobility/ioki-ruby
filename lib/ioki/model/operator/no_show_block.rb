# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class NoShowBlock < Base
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

        attribute :acknowledged_at,
                  on:   :read,
                  type: :date_time

        attribute :acknowledged_id,
                  on:   :read,
                  type: :string

        attribute :acknowledged_type,
                  on:   :read,
                  type: :string

        attribute :acknowledger_name,
                  on:   :read,
                  type: :string

        attribute :blocked_from,
                  on:   :read,
                  type: :date_time

        attribute :blocked_until,
                  on:   :read,
                  type: :date_time
      end
    end
  end
end
