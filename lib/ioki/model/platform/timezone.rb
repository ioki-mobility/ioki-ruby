# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Timezone < Ioki::Model::Base
        # Note that this does not inherit from Base because it does not implement :created_at, :updated_at and :id.

        unvalidated true # No specification available.

        attribute :identifier, on: :read, type: :string
        attribute :utc_offset, on: :read, type: :integer
      end
    end
  end
end
