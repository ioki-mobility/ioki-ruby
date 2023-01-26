# frozen_string_literal: true

module Ioki
  module Model
    module Platform
      class Base < Ioki::Model::Base
        def self.specification_scope
          'platform_api--v20210101'
        end
      end
    end
  end
end
