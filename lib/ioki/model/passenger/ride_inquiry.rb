# frozen_string_literal: true

require 'ioki/model/passenger/requested_point'

module Ioki
  module Model
    module Passenger
      class RideInquiry < Base
        attribute :origin,         type: :object,  on: :create, model_class: Ioki::Model::Passenger::RequestedPoint
        attribute :destination,    type: :object,  on: :create, model_class: Ioki::Model::Passenger::RequestedPoint
      end
    end
  end
end
