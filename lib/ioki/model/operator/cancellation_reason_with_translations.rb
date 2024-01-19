# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class CancellationReasonWithTranslations < Base
        attribute :slug,
                  on:   :read,
                  type: :string

        attribute :translations,
                  on:         :read,
                  type:       :object,
                  class_name: 'MultilanguageString'

      end
    end
  end
end
