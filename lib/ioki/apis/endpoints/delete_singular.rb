# frozen_string_literal: true

module Ioki
  module Endpoints
    class DeleteSingular < Delete
      def full_path
        base_path + [resource_path_name]
      end
    end
  end
end
