# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class LineState < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :limit_reached,
                  on:   :read,
                  type: :boolean

        attribute :lines,
                  on:         :read,
                  type:       :array,
                  class_name: 'LineStates::Line'

        attribute :line_stops,
                  on:         :read,
                  type:       :array,
                  class_name: 'LineStates::LineStop'
      end
    end
  end
end
