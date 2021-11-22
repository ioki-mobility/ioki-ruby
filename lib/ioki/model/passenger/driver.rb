# frozen_string_literal: true

require 'ioki/model/passenger/vehicle'

module Ioki
  module Model
    module Passenger
      class Driver < Base
        attribute :connected_vehicle, type: :object,    on: :read, model_class: Ioki::Model::Passenger::Vehicle
        attribute :display_name,      type: :string,    on: :read
      end
    end
  end
end
