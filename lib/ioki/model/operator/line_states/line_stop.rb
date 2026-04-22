# frozen_string_literal: true

# frozen_ string_literal: true

module Ioki
  module Model
    module Operator
      module LineStates
        class LineStop < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :id,
                    on:   :read,
                    type: :string

          attribute :line_id,
                    on:   :read,
                    type: :string

          attribute :station_id,
                    on:   :read,
                    type: :string

          attribute :relative_time,
                    on:   :read,
                    type: :integer

          attribute :dropoff_mode,
                    on:   :read,
                    type: :string

          attribute :pickup_mode,
                    on:   :read,
                    type: :string

          attribute :supports_pickup,
                    on:   :read,
                    type: :boolean

          attribute :supports_dropoff,
                    on:   :read,
                    type: :boolean

          attribute :supports_pass_through,
                    on:   :read,
                    type: :boolean

          attribute :tier,
                    on:   :read,
                    type: :integer
        end
      end
    end
  end
end
