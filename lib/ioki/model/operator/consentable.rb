# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Consentable < Base
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

        attribute :changed_at,
                  on:   :read,
                  type: :date_time

        attribute :must_accept,
                  on:   :read,
                  type: :boolean

        attribute :required_pre_registration,
                  on:   :read,
                  type: :boolean

        attribute :website_url,
                  on:   :read,
                  type: :string

        attribute :translated_name,
                  on:   :read,
                  type: :string

        attribute :translated_description,
                  on:   :read,
                  type: :string

        attribute :translated_link_text,
                  on:   :read,
                  type: :string

        attribute :translated_agree_phrase,
                  on:   :read,
                  type: :string

        attribute :translated_disagree_phrase,
                  on:   :read,
                  type: :string

        attribute :accepted_at,
                  on:   :read,
                  type: :date_time

        attribute :rejected_at,
                  on:   :read,
                  type: :date_time

        attribute :accepted,
                  on:   :read,
                  type: :boolean

        attribute :rejected,
                  on:   :read,
                  type: :boolean

        attribute :awaiting_decision,
                  on:   :read,
                  type: :boolean

        attribute :mandatory_but_not_accepted,
                  on:   :read,
                  type: :boolean
      end
    end
  end
end
