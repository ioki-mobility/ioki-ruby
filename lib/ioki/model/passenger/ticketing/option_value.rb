# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Ticketing
        class OptionValue < Base
          attribute :type, on: :read, type: :string
          attribute :slug, on: :read, type: :string
          attribute :value, on: :read, type: :string
        end
      end
    end
  end
end
