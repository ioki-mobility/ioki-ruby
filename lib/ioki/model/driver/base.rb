# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class Base < Ioki::Model::Base
        def self.specification_scope
          'driver_api--v2'
        end
      end
    end
  end
end
