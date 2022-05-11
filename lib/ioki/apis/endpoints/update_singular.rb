# frozen_string_literal: true

module Endpoints
  class UpdateSingular < Update
    def full_path
      base_path + [resource.to_s]
    end
  end
end
