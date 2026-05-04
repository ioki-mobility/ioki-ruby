# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Reporting
        class QuotaMetric < Base
          attribute :id,
                    on:   :read,
                    type: :string

          attribute :type,
                    on:   :read,
                    type: :integer

          attribute :created_at,
                    on:   :read,
                    type: :date_time

          attribute :updated_at,
                    on:   :read,
                    type: :date_time

          attribute :provider_id,
                    on:   :read,
                    type: :string

          attribute :realm,
                    on:   :read,
                    type: :string

          attribute :usecase,
                    on:   :read,
                    type: :string

          attribute :subcase,
                    on:   :read,
                    type: :string

          attribute :accumulated_size,
                    on:   :read,
                    type: :integer

          attribute :accumulated_time,
                    on:   :read,
                    type: :float

          attribute :num_samples,
                    on:   :read,
                    type: :integer

          attribute :starts_at,
                    on:   :read,
                    type: :date_time

          attribute :ends_at,
                    on:   :read,
                    type: :date_time
        end
      end
    end
  end
end
