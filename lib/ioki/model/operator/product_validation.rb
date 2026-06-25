# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class ProductValidation < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :slug,
                  on:   :read,
                  type: :string

        attribute :severity,
                  on:   :read,
                  type: :string

        attribute :title,
                  on:   :read,
                  type: :string

        attribute :description,
                  on:   :read,
                  type: :string

        attribute :follow_request,
                  on:         :read,
                  type:       :object,
                  class_name: 'ProductValidations::FollowRequest'
      end
    end
  end
end
