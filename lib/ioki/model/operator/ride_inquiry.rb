# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RideInquiry < Base
        def self.schema_path
          'operator_api--v20210101--ride_inquiry_schema'
        end

        attribute :passengers, type: :array, on: [:create, :read, :update]
        # attribute :type,
        #           on:   :read,
        #           type: :string

        # attribute :id,
        #           on:   :read,
        #           type: :string

        # attribute :created_at,
        #           on:   :read,
        #           type: :date_time

        # attribute :updated_at,
        #           on:   :read,
        #           type: :date_time

        # The model does not return it but it's used when sending data to the server.
        attribute :origin,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :object,
                  class_name:     'RequestedPoint',
                  unvalidated:    true

        # The model does not return it but it's used when sending data to the server.
        attribute :destination,
                  on:             :create,
                  omit_if_nil_on: [:create],
                  type:           :object,
                  class_name:     'RequestedPoint',
                  unvalidated:    true

        # attribute :constraints,
        #           on:         :read,
        #           type:       :object,
        #           class_name: 'Constraints'
      end
    end
  end
end
