# frozen_string_literal: true

require 'ioki/model/platform/requested_point'

module Ioki
  module Model
    module Platform
      class RideInquiry < Base
        attribute :origin,         type: :object,  on: :create, model_class: Ioki::Model::Platform::RequestedPoint
        attribute :destination,    type: :object,  on: :create, model_class: Ioki::Model::Platform::RequestedPoint
      end
    end
  end
end
