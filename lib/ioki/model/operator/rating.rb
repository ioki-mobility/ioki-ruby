# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Rating < Base
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

        attribute :comment,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :driver_rating,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :editable,
                  on:   :read,
                  type: :boolean

        attribute :punctuality_rating,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :ride_rating,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :ride_version,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :service_rating,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :vehicle_rating,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :vehicle_cleanliness_rating,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :version,
                  on:   [:create, :read, :update],
                  type: :integer

        attribute :waiting_time_rating,
                  on:   [:create, :read, :update],
                  type: :integer
      end
    end
  end
end
