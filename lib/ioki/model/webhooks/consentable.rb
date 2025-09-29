# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Consentable < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :slug, type: :string
        attribute :changed_at, type: :date_time
        attribute :must_accept, type: :boolean
        attribute :required_pre_registration, type: :boolean
        attribute :website_url, type: :string
        attribute :translated_name, type: :string
        attribute :translated_description, type: :string
        attribute :translated_link_text, type: :string
        attribute :translated_agree_phrase, type: :string
        attribute :translated_disagree_phrase, type: :string
        attribute :accepted_at, type: :date_time
        attribute :rejected_at, type: :date_time
        attribute :accepted, type: :boolean
        attribute :rejected, type: :boolean
        attribute :awaiting_decision, type: :boolean
        attribute :mandatory_but_not_accepted, type: :boolean
      end
    end
  end
end
