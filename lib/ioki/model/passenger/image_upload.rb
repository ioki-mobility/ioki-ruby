# frozen_string_literal: true

require 'ioki/model/passenger/image_version'

module Ioki
  module Model
    module Passenger
      class ImageUpload < Base
        attribute :versions, on: :read, type: :array, model_class: ImageVersion
      end
    end
  end
end
