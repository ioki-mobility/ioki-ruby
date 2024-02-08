# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RematchingSuggestion < Base
        attribute :task_lists,
                  on:         :read,
                  type:       :array,
                  class_name: 'TaskList'
      end
    end
  end
end
