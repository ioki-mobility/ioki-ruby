# frozen_string_literal: true

require 'ioki/model/passenger/mobile_ticket_data'

module Ioki
  module Model
    module Passenger
      class Ticket < Base
        attribute :cancellation_reason, on: :read, type: :string
        attribute :host, on: :read, type: :string
        attribute :issued_at, on: :read, type: :date_time
        attribute :issuer, on: :read, type: :string
        attribute :mobile_ticket_data, on: :read, type: :array, model_class: MobileTicketData
        attribute :retrieved_at, on: :read, type: :date_time
        attribute :state, on: :read, type: :string
        attribute :ticket_url, on: :read, type: :string
      end
    end
  end
end