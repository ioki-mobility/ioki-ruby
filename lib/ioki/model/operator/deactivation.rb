# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Deactivation < Base
        attribute :ends_at, on: :read, type: :date_time
        attribute :starts_at, on: :read, type: :date_time
      end
    end
  end
end
