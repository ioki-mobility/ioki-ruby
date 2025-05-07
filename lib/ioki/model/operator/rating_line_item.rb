# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RatingLineItem < Base
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

        attribute :criterion_slug,
                  on:   :read,
                  type: :string

        attribute :value,
                  on:   :read,
                  type: :integer
      end
    end
  end
end
