# frozen_string_literal: true

module Ioki
  module Model
    module Reporting
      class Incidence < Base
        attribute :name,
                  on:   :read,
                  type: :string

        attribute :quantity,
                  on:   :read,
                  type: :integer

        attribute :created_at,
                  on:   :read,
                  type: :date_time
      end
    end
  end
end
