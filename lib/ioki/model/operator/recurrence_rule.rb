# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RecurrenceRule < Base
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

        attribute :day_of_week,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :valid_from_offset,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :valid_until_offset,
                  on:   [:create, :read, :update],
                  type: :integer
      end
    end
  end
end
