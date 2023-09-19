# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class UserAutocompletes < Base
        base 'Array', item_class_name: 'UserAutocomplete'
      end
    end
  end
end
