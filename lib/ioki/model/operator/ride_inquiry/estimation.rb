# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module RideInquiry
        class Estimation < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :confidence,
                    on:   :read,
                    type: :decimal

          attribute :dropoff,
                    on:         :read,
                    type:       :object,
                    class_name: 'CalculatedPoint'

          attribute :estimation_type,
                    on:   :read,
                    type: :string

          attribute :meta_data,
                    on:   :read,
                    type: :object

          attribute :pickup,
                    on:         :read,
                    type:       :object,
                    class_name: 'CalculatedPoint'
        end
      end
    end
  end
end
