# frozen_string_literal: true

require 'ioki/model/platform/package'

module Ioki
  module Model
    module Platform
      class ServiceCreditOptions < Base
        unvalidated true

        attribute :packages, on: :read, type: :array, model_class: Ioki::Model::Platform::Package
      end
    end
  end
end
