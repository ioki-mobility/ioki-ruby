# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Referrals < Base
        attribute :description,
                  on:   :read,
                  type: :string
      end
    end
  end
end
