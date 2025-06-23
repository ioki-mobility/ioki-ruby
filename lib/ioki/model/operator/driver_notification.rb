# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class DriverNotification < Base
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

        attribute :receiver_id,
                  on:   :read,
                  type: :string

        attribute :receiver_name,
                  on:   :read,
                  type: :string

        attribute :read_at,
                  on:   :read,
                  type: :date_time
      end
    end
  end
end
