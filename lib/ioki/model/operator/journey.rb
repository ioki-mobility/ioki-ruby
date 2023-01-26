# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Journey < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :legs,
                  on:         :read,
                  type:       :array,
                  class_name: 'Leg'

        attribute :version,
                  on:   :read,
                  type: :integer
      end
    end
  end
end
