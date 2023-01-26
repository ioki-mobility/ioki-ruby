# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class Ticket < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :cancellation_reason, on: :read, type: :string
        attribute :host, on: :read, type: :string
        attribute :issued_at, on: :read, type: :date_time
        attribute :issuer, on: :read, type: :string
        attribute :mobile_ticket_data, on: :read, type: :array, class_name: 'MobileTicketData'
        attribute :retrieved_at, on: :read, type: :date_time
        attribute :state, on: :read, type: :string
        attribute :ticket_url, on: :read, type: :string
      end
    end
  end
end
