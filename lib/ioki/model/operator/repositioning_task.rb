# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RepositioningTask < Base
        attribute :lat,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :float

        attribute :lng,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :float

        attribute :location_name,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :street_name,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :street_number,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :postal_code,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :city,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :county,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :country,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :string

        attribute :time_min,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :date_time

        attribute :time,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :date_time

        attribute :time_max,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :date_time

        attribute :dismissable,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :boolean
      end
    end
  end
end
