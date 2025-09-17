# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module RideInquiries
        class Estimation < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :confidence,
                    on:   :read,
                    type: :float

          attribute :dropoff,
                    on:         :read,
                    type:       :object,
                    class_name: 'Ioki::Model::Operator::CalculatedPoint'

          attribute :estimation_type,
                    on:   :read,
                    type: :string

          attribute :meta_data,
                    on:   :read,
                    type: :object

          attribute :pickup,
                    on:         :read,
                    type:       :object,
                    class_name: 'Ioki::Model::Operator::CalculatedPoint'
        end
      end
    end
  end
end
