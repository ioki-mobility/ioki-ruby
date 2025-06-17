# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RatingCriterion < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :slug,
                  on:   :read,
                  type: :string

        attribute :default,
                  on:   :read,
                  type: :boolean

        attribute :localized_name_translations,
                  on:         :read,
                  type:       :object,
                  class_name: 'MultilanguageString'

        attribute :localized_description_translations,
                  on:         :read,
                  type:       :object,
                  class_name: 'MultilanguageString'
      end
    end
  end
end
