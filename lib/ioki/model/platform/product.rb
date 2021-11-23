# frozen_string_literal: true

require 'ioki/model/platform/area'
require 'ioki/model/platform/bounding_box'
require 'ioki/model/platform/matching_configuration'
require 'ioki/model/platform/provider'
require 'ioki/model/platform/ride_options'
require 'ioki/model/platform/station'
require 'ioki/model/platform/time_zone'

module Ioki
  module Model
    module Platform
      class Product < Base
        attribute :name, on: :read
        attribute :provider, type: :object, on: :read, model_class: Ioki::Model::Platform::Provider
        attribute :area, type: :object, on: :read, model_class: Ioki::Model::Platform::Area
        attribute :ad_hoc_bookable, on: :read, type: :boolean
        attribute :bounding_box, on: :read, type: :object, model_class: Ioki::Model::Platform::BoundingBox
        attribute :description, on: :read, type: :string
        attribute :fixed_stations, on: :read, type: :array, model_class: Ioki::Model::Platform::Station
        attribute :matching_configurations, on: :read, type: :array, model_class: Ioki::Model::Platform::MatchingConfiguration
        attribute :prebookable, on: :read, type: :boolean
        attribute :ride_options, on: :read, type: :object, model_class: Ioki::Model::Platform::RideOptions
        attribute :ride_rating_criteria, on: :read, type: :array
        attribute :service_time_info, on: :read, type: :string
        attribute :timezone, on: :read, type: :object, model_class: Ioki::Model::Platform::TimeZone
        attribute :version, on: :read, type: :integer
      end
    end
  end
end
