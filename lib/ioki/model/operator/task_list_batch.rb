# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class TaskListBatch < Base
        def self.schema_path
          'operator_api--v20210101--task_list_batch_destroy_schema'
        end

        attribute :task_list_ids,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :array
      end
    end
  end
end
