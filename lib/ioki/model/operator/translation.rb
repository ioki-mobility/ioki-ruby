# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Translation < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :language,
                  on:   :read,
                  type: :string

        attribute :text,
                  on:   :read,
                  type: :string
      end
    end
  end
end
