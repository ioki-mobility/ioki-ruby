# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RematchingAttempt < Base
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

        attribute :auto_finish_empty_task_list,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :boolean

        attribute :auto_cancel_failed_rematchings,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :boolean

        attribute :finished_at,
                  on:   :read,
                  type: :date_time

        attribute :preserve_negotiated_times,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :boolean

        attribute :reassigner_id,
                  on:   :read,
                  type: :string

        attribute :reassigner_type,
                  on:   :read,
                  type: :string

        attribute :results,
                  on:         :read,
                  type:       :array,
                  class_name: 'RematchingAttemptResult'

        attribute :ride_ids,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :array

        attribute :started_at,
                  on:   :read,
                  type: :date_time

        attribute :task_list_id,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :whitelisted_task_list_ids,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :array
      end
    end
  end
end
