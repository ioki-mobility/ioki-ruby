# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class NoShow < Base
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

        attribute :ride_id,
                  on:   :read,
                  type: :string
      end
    end
  end
end
