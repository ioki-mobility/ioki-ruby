# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class ImageUpload < Base
        attribute :versions, on: :read, type: :array, class_name: 'ImageVersion'
      end
    end
  end
end
