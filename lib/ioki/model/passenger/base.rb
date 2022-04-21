# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Base < Ioki::Model::Base
        def self.specification_scope
          'passenger_api'
        end
      end
    end
  end
end
