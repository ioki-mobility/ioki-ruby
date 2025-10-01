# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class AdminAccount < Base
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

        attribute :email,
                  on:   :read,
                  type: :string

        attribute :first_name,
                  on:   :read,
                  type: :string

        attribute :last_name,
                  on:   :read,
                  type: :string

        attribute :locale,
                  on:   :read,
                  type: :string

        attribute :unread_count,
                  on:   :read,
                  type: :integer

        attribute :permissions,
                  on:         :read,
                  type:       :array,
                  class_name: 'Ioki::Model::Operator::Permission'

        attribute :consentables,
                  on:         :read,
                  type:       :array,
                  class_name: 'Ioki::Model::Operator::Consentable'
      end
    end
  end
end
