# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Payment
        class FailedPurchasesSummary < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :has_failed_payments,
                    on:   :read,
                    type: :boolean

          attribute :count,
                    on:   :read,
                    type: :integer

          attribute :amounts,
                    on:   :read,
                    type: :array
        end
      end
    end
  end
end
