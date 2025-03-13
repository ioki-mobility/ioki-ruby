# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class DriverReport < Base
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

        attribute :category,
                  on:   :read,
                  type: :string

        attribute :driver_id,
                  on:   :read,
                  type: :string

        attribute :driver_name,
                  on:   :read,
                  type: :string

        attribute :driver_report_type,
                  on:   :read,
                  type: :string

        attribute :message,
                  on:   :read,
                  type: :string

        attribute :acknowledged_at,
                  on:   :read,
                  type: :date_time

        attribute :acknowledger_type,
                  on:   :read,
                  type: :string

        attribute :acknowledger_name,
                  on:   :read,
                  type: :string
      end
    end
  end
end
