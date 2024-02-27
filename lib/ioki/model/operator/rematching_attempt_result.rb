# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RematchingAttemptResult < Base
        attribute :ride_id,
                  on:   :read,
                  type: :string

        attribute :type,
                  on:   :read,
                  type: :string

        attribute :cancellation_done,
                  on:   :read,
                  type: :boolean

        attribute :new_task_list_id,
                  on:   :read,
                  type: :string

        attribute :old_task_list_id,
                  on:   :read,
                  type: :string

        attribute :preserved_time,
                  on:   :read,
                  type: :boolean

        attribute :success,
                  on:   :read,
                  type: :boolean

        attribute :tried_to_cancel,
                  on:   :read,
                  type: :boolean
      end
    end
  end
end
