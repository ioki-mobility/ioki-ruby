# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Products
        class NoShow < Base
          attribute :id,
                    on:   :read,
                    type: :string

          attribute :created_at,
                    on:   :read,
                    type: :date_time

          attribute :updated_at,
                    on:   :read,
                    type: :date_time

          attribute :type,
                    on:   :read,
                    type: :string

          attribute :first_name,
                    on:   :read,
                    type: :string

          attribute :last_name,
                    on:   :read,
                    type: :string

          attribute :total_no_shows,
                    on:   :read,
                    type: :integer

          attribute :unacknowledged_no_shows,
                    on:   :read,
                    type: :integer

          attribute :unacknowledged_in_product_no_show_timeframe,
                    on:   :read,
                    type: :integer

          attribute :no_show_blocked?,
                    on:   :read,
                    type: :boolean

          attribute :no_show_blocked_until,
                    on:   :read,
                    type: :date_time
        end
      end
    end
  end
end
