# frozen_string_literal: true

require 'ioki/model/platform/calculated_point'
require 'ioki/model/platform/requested_point'
require 'ioki/model/platform/ride_passenger'
require 'ioki/model/platform/user'
require 'ioki/model/platform/booking'
require 'ioki/model/platform/rating'

module Ioki
  module Model
    module Platform
      class Ride < Base
        attribute :state,          type: :string,  on: :read
        attribute :origin,         type: :object,  on: [:create, :read],
model_class: Ioki::Model::Platform::RequestedPoint
        attribute :destination,    type: :object,  on: [:create, :read],
model_class: Ioki::Model::Platform::RequestedPoint
        attribute :passengers,     type: :array,   on: [:create, :read],
model_class: Ioki::Model::Platform::RidePassenger
        attribute :user_id,        type: :string,  on: [:create, :update]
        attribute :product_id,     type: :string,  on: [:read, :create, :update]
        attribute :user,           type: :object,  on: :read, model_class: Ioki::Model::Platform::User
        attribute :version,        type: :string,  on: :update
        attribute :booking,        type: :object,  on: :read, model_class: Ioki::Model::Platform::Booking
        attribute :pickup,         type: :object,  on: :read, model_class: Ioki::Model::Platform::CalculatedPoint
        attribute :dropoff,        type: :object,  on: :read, model_class: Ioki::Model::Platform::CalculatedPoint
        attribute :storage_spaces, type: :integer, on: [:read, :create, :update], omit_if_blank_on: [:create, :update]
        attribute :rating,         type: :object,  on: :read, model_class: Ioki::Model::Platform::Rating
      end
    end
  end
end
