# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class PassengerType < Base
        unvalidated true # Specification not available.

        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time

        attribute :bookable, on: :read, type: :boolean
        attribute :name, on: :read, type: :string
        attribute :slug, on: :read, type: :string
        attribute :option_type, on: :read, type: :string
        attribute :name_translations, on: :read, type: :object, class_name: 'MultilanguageString'
        attribute :description_translations, on: :read, type: :object, class_name: 'MultilanguageString'
        attribute :info_translations, on: :read, type: :object, class_name: 'MultilanguageString'
        attribute :link_translations, on: :read, type: :object, class_name: 'MultilanguageString'
        attribute :link_text_translations, on: :read, type: :object, class_name: 'MultilanguageString'
      end
    end
  end
end
