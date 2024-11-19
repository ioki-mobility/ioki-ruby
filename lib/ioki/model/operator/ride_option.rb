# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class RideOption < Base
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
                  on:   [:read, :create],
                  type: :string

        attribute :default_value,
                  on:   [:read, :create, :update],
                  type: [:string, :boolean, :integer]

        attribute :bookable,
                  on:   [:read, :create, :update],
                  type: :boolean

        attribute :data_type,
                  on:   [:read, :create],
                  type: :string

        attribute :option_type,
                  on:   [:read, :create, :update],
                  type: :string

        attribute :sort_key,
                  on:   [:read, :create, :update],
                  type: :integer

        attribute :localized_accessibility_information,
                  on:   :read,
                  type: :string

        attribute :localized_name,
                  on:   :read,
                  type: :string

        attribute :localized_description,
                  on:   :read,
                  type: :string

        attribute :localized_info,
                  on:   :read,
                  type: :string

        attribute :localized_link,
                  on:   :read,
                  type: :string

        attribute :localized_link_text,
                  on:   :read,
                  type: :string

        attribute :accessibility_information_translations,
                  on:   [:read, :create, :update],
                  type: :object

        attribute :name_translations,
                  on:   [:read, :create, :update],
                  type: :object

        attribute :description_translations,
                  on:   [:read, :create, :update],
                  type: :object

        attribute :info_translations,
                  on:   [:read, :create, :update],
                  type: :object

        attribute :link_translations,
                  on:   [:read, :create, :update],
                  type: :object

        attribute :link_text_translations,
                  on:   [:read, :create, :update],
                  type: :object

        attribute :resource_consumption,
                  on:         [:read, :create, :update],
                  type:       :object,
                  class_name: 'ResourceConfiguration'
      end
    end
  end
end
