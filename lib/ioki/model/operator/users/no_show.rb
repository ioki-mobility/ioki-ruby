# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Users
        class NoShow < Ioki::Model::Base
          attribute :id,
                    on:   :read,
                    type: :string

          attribute :created_at,
                    on:   :read,
                    type: :date_time

          attribute :updated_at,
                    on:   :read,
                    type: :date_time

          attribute :type,
                    on:   :read,
                    type: :string

          attribute :acknowledged_at,
                    on:   :read,
                    type: :date_time

          attribute :ride_id,
                    on:   :read,
                    type: :string

          attribute :user_id,
                    on:   :read,
                    type: :string

          attribute :acknowledger_name,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
