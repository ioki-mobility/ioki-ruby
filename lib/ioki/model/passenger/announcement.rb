# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Announcement < Base
        attribute :additional_information_url, on: :read, type: :string
        attribute :ends_at, on: :read, type: :date_time
        attribute :severity, on: :read, type: :string
        attribute :show_on_every_app_start, on: :read, type: :boolean
        attribute :starts_at, on: :read, type: :date_time
        attribute :text, on: :read, type: :string
        attribute :title, on: :read, type: :string
      end
    end
  end
end
