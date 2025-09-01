# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class GeocodingSearch < Base
        attribute :query,
                  on:   :create,
                  type: :string
      end
    end
  end
end
