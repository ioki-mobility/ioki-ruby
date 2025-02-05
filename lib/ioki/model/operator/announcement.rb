# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Announcement < Base
        attribute :id,
                  on:   :read,
                  type: :string

        attribute :type,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :additional_information_url,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :ends_at,
                  on:   [:create, :read, :update],
                  type: :date_time

        attribute :severity,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :show_on_every_app_start,
                  on:   [:create, :read, :update],
                  type: :boolean

        attribute :starts_at,
                  on:   [:create, :read, :update],
                  type: :date_time

        attribute :text,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :title,
                  on:   [:create, :read, :update],
                  type: :string

        attribute :targets,
                  on:   [:create, :read, :update],
                  type: :array

        attribute :resource_id,
                  on:             [:create, :read, :update],
                  omit_if_nil_on: [:create, :update],
                  type:           :string
      end
    end
  end
end
