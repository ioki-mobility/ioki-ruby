# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      module Ticketing
        class Ticket < Base
          attribute :type, on: :read, type: :string
          attribute :id, on: :read, type: :string
          attribute :created_at, on: :read, type: :date_time
          attribute :updated_at, on: :read, type: :date_time
          attribute :voucher_id, on: :read, type: :string
          attribute :issuer_slug, on: :read, type: :string
          attribute :access_token, on: :read, type: :string
          attribute :webview_url, on: :read, type: :string
          attribute :validity_information, on: :read, type: :string
          attribute :valid_from, on: :read, type: :date_time
          attribute :valid_until, on: :read, type: :date_time
        end
      end
    end
  end
end
