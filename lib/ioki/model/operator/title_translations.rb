# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class TitleTranslations < Base
        attribute :de,
                  on:   [:create],
                  type: :string
      end
    end
  end
end
