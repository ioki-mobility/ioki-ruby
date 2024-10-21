# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class TitleTranslations < Base
        attribute :en,
                  on:   [:create],
                  type: :string

        attribute :de,
                  on:   [:create],
                  type: :string
      end
    end
  end
end
