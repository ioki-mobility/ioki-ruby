# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class AdminAccount < Base
        attribute :type,
                  type: :string

        attribute :id,
                  type: :string

        attribute :created_at,
                  type: :date_time

        attribute :updated_at,
                  type: :date_time

        attribute :email,
                  type: :string

        attribute :first_name,
                  type: :string

        attribute :last_name,
                  type: :string

        attribute :locale,
                  type: :string

        attribute :unread_count,
                  type: :integer

        attribute :permissions,
                  type:       :array,
                  class_name: 'Ioki::Model::Webhooks::Permission'

        attribute :consentables,
                  type:       :array,
                  class_name: 'Ioki::Model::Webhooks::Consentable'
      end
    end
  end
end
