# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Payment
        class OpenUrl < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :url,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
