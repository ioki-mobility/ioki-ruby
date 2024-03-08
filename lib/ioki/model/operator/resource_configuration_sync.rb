# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ResourceConfigurationSync < Base
        attribute :vehicle_ids,
                  on:             [:create, :read],
                  omit_if_nil_on: [:create],
                  type:           :array
      end
    end
  end
end
