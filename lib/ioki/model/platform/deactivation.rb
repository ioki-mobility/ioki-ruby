# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Deactivation < Base
        attribute :ends_at, on: :read, type: :string
        attribute :starts_at, on: :read, type: :string
      end
    end
  end
end
