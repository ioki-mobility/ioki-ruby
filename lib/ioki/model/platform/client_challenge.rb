# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class ClientChallenge < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time
        attribute :challenge, on: :read, type: :string

        # attribute :solution, on: :create, type: :string
        # attribute :nonce, on: :create, type: :string
      end
    end
  end
end
