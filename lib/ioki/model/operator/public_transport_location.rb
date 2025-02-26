# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class PublicTransportLocation < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :ext_id,
                  on:   :read,
                  type: :string

        attribute :name,
                  on:   :read,
                  type: :string

        attribute :lat,
                  on:   :read,
                  type: :float

        attribute :lng,
                  on:   :read,
                  type: :float

        attribute :tranpsport_types,
                  on:   :read,
                  type: :array

        attribute :connections,
                  on:   :read,
                  type: :object

        attribute :weight,
                  on:   :read,
                  type: :integer
      end
    end
  end
end
