# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module LineStates
        class Line < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :id,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :slug,
                    on:   :read,
                    type: :string

          attribute :mode,
                    on:   :read,
                    type: :string

          attribute :route_number,
                    on:   :read,
                    type: :string

          attribute :skip_time_window_check,
                    on:   :read,
                    type: :boolean

          attribute :variant,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
