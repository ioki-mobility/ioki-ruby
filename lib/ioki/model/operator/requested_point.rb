# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RequestedPoint < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :city,             type: :string,    on: [:create, :read], omit_if_blank_on: :create
        attribute :country,          type: :string,    on: [:create, :read], omit_if_blank_on: :create
        attribute :county,           type: :string,    on: [:create, :read], omit_if_blank_on: :create
        attribute :display_times,    type: :array,     on: [:create, :read], omit_if_blank_on: :create
        attribute :formatted_street, type: :string,    on: [:create, :read], omit_if_blank_on: :create
        attribute :lat,              type: :float,     on: [:create, :read], omit_if_blank_on: :create
        attribute :lng,              type: :float,     on: [:create, :read], omit_if_blank_on: :create
        attribute :location_name,    type: :string,    on: [:create, :read], omit_if_blank_on: :create
        attribute :postal_code,      type: :string,    on: [:create, :read], omit_if_blank_on: :create
        attribute :station_id,       type: :string,    on: [:create, :read], omit_if_blank_on: :create
        attribute :street_name,      type: :string,    on: [:create, :read], omit_if_blank_on: :create
        attribute :street_number,    type: :string,    on: [:create, :read], omit_if_blank_on: :create
        attribute :time,             type: :date_time, on: [:create, :read], omit_if_blank_on: :create
        attribute :waypoint_type,    type: :string,    on: [:create, :read], omit_if_blank_on: :create
      end
    end
  end
end
