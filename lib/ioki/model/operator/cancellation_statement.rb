# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class CancellationStatement < Base
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

        attribute :group,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :identifier,
                  on:   :read,
                  type: :string

        attribute :suitable_for_ride_series,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :suitable_for_single_rides,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :passenger_notification,
                  on:   :read,
                  type: :string

        attribute :title,
                  on:   :read,
                  type: :string

        attribute :passenger_notification_translations,
                  on:   [:create, :read, :update],
                  type: :object

        attribute :title_translations,
                  on:   [:create, :read, :update],
                  type: :object
      end
    end
  end
end
