# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class BatchDeletionRequest < Base
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

        attribute :finished_at,
                  on:   :read,
                  type: :date_time

        attribute :performer_id,
                  on:   :read,
                  type: :string

        attribute :performer_type,
                  on:   :read,
                  type: :string

        attribute :resource_ids,
                  on:   :read,
                  type: :array

        attribute :resource_type,
                  on:   :read,
                  type: :string

        attribute :started_at,
                  on:   :read,
                  type: :date_time
      end
    end
  end
end
