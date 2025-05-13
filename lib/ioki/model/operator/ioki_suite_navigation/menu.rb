# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      module IokiSuiteNavigation
        class Menu < Base
          attribute :type,
                    on:   :read,
                    type: :string

          attribute :slug,
                    on:   :read,
                    type: :string

          attribute :icon,
                    on:   :read,
                    type: :string

          attribute :name,
                    on:   :read,
                    type: :string

          attribute :link,
                    on:   :read,
                    type: :string

          attribute :menu_items,
                    on:         :read,
                    type:       :array,
                    class_name: %w[Menu Label Divider]
        end
      end
    end
  end
end
