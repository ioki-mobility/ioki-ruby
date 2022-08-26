# frozen_string_literal: true

module Ioki
  module Endpoints
    class ShowSingular < Show
      def full_path
        @path || (base_path + [resource.to_s])
      end
    end
  end
end
