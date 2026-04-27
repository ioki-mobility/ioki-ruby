# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module ProductValidations
        class FollowRequest < Base
          attribute :resource,
                    on:   :read,
                    type: :string

          attribute :filter,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
