# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module RideInquiry
        class Assistance < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :href,
                    on:   :read,
                    type: :string

          attribute :text,
                    on:   :read,
                    type: :string

          attribute :title,
                    on:   :read,
                    type: :string

          attribute :error_code,
                    on:   :read,
                    type: :string
        end
      end
    end
  end
end
