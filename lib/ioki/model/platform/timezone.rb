# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Timezone < Base
        unvalidated true # No specification available.

        attribute :identifier, on: :read, type: :string
        attribute :utc_offset, on: :read, type: :integer
      end
    end
  end
end
