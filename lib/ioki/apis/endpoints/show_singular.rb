# frozen_string_literal: true

module Endpoints
  class ShowSingular < Show
    def full_path
      @path || (base_path + [resource.to_s])
    end
  end
end
