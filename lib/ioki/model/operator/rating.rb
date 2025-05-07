# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Rating < Base
        attribute :rating_line_items, type: :array, on: [:create, :read, :update]
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

        deprecated_attribute :autonomous_feeling_of_security_rating,
                             on:   :read,
                             type: :integer

        deprecated_attribute :autonomous_happiness_rating,
                             on:   :read,
                             type: :integer

        attribute :comment,
                  on:   :read,
                  type: :string

        deprecated_attribute :driver_rating,
                             on:   :read,
                             type: :integer

        attribute :editable,
                  on:   :read,
                  type: :boolean

        deprecated_attribute :punctuality_rating,
                             on:   :read,
                             type: :integer

        deprecated_attribute :ride_rating,
                             on:   :read,
                             type: :integer

        # attribute :ride_version,
        #           on:   :read,
        #           type: :integer

        deprecated_attribute :service_rating,
                             on:   :read,
                             type: :integer

        deprecated_attribute :vehicle_rating,
                             on:   :read,
                             type: :integer

        deprecated_attribute :vehicle_cleanliness_rating,
                             on:   :read,
                             type: :integer

        attribute :version,
                  on:   :read,
                  type: :integer

        deprecated_attribute :waiting_time_rating,
                             on:   :read,
                             type: :integer

        attribute :rating_line_items,
                  on:         :read,
                  type:       :array,
                  class_name: 'RatingLineItem'
      end
    end
  end
end
