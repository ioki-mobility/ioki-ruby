# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Referrals < Base
        attribute :description,
                  type: :string,
                  on:   :read
      end
    end
  end
end
