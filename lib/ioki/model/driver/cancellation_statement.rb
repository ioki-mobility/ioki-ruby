# frozen_string_literal: true

module Ioki
  module Model
    module Driver
      class CancellationStatement < Base
        attribute :identifier, on: :read, type: :string
        attribute :title, on: :read, type: :string
      end
    end
  end
end
