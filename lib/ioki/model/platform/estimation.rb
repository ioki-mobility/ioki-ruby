# frozen_string_literal: true

require 'ioki/model/platform/fare'
require 'ioki/model/platform/ride_inquiry_link'
require 'ioki/model/platform/calculated_point'

module Ioki
  module Model
    module Platform
      class Estimation < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at and :id.

        def self.schema_path
          'platform_api--v20210101--ride_inquiry--estimation'
        end

        attribute :type, on: :read, type: :string
        attribute :confidence, on: :read, type: :float
        attribute :dropoff, on: :read, type: :object, model_class: CalculatedPoint
        attribute :estimation_type, on: :read, type: :string
        attribute :fare, on: :read, type: :object, model_class: Fare
        attribute :links, on: :read, type: :array, model_class: RideInquiryLink
        # Quote from the API docs: "Additional metadata about the estimation, no specified format (yet)"
        attribute :meta_data, on: :read, type: :object
        attribute :pickup, on: :read, type: :object, model_class: CalculatedPoint
      end
    end
  end
end
