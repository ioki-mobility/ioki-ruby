# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module Account
        class Settings < Base
          attribute :first_name,
                    on:   :update,
                    type: :string

          attribute :last_name,
                    on:   :update,
                    type: :string

          attribute :locale,
                    on:   :update,
                    type: :string

          attribute :timezone_identifier,
                    on:   :update,
                    type: :string
        end
      end
    end
  end
end
