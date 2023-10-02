# frozen_string_literal: true

namespace :ioki do
  namespace :openapi do
    desc 'Remove unspecified and add missing attributes from OpenAPI specification'
    task :repair do
      require 'open_api'
      OpenApi::Specification.all.map(&:repair)
    end
  end
end
