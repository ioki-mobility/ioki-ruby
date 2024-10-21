# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class MultilanguageString < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :name,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :translations,
                  on:         [:create, :read, :update],
                  type:       :array,
                  class_name: 'Translation'
      end
    end
  end
end
