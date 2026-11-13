# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      module HardwareIntegration
        class StateChangeRequest < Base
          attribute :requested_state,
                    on:   :create,
                    type: :string
        end
      end
    end
  end
end
