# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Payment
        class ChargeChallenge < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :action,
                    on:         :read,
                    type:       :object,
                    class_name: ['OpenUrl']
        end
      end
    end
  end
end
