# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class NotificationSettings < Base
        attribute :root, on: [:read, :update], type: :array

        def serialize(usecase = :read)
          serialized_data = super(usecase)

          serialized_data[:root]
        end
      end
    end
  end
end
