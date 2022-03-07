# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Base < Ioki::Model::Base
        def self.specification_scope
          'webhooks--v20201201'
        end

        def self.valid_definition?(_definition)
          true
        end
      end
    end
  end
end
