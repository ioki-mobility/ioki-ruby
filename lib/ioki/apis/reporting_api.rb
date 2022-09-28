# frozen_string_literal: true

require 'ioki/model'
require 'ioki/apis/endpoints/endpoints'

module Ioki
  class ReportingApi
    # for now the api base path is 'operator' this will change
    # as soon as reporting has its own namespace in triebwerk
    API_BASE_PATH = 'operator'
    ENDPOINTS = [
      Endpoints.crud_endpoints(
        :incidence,
        base_path:   [API_BASE_PATH, 'reporting'],
        model_class: Ioki::Model::Reporting::Incidence,
        except:      [:create, :update, :delete, :show]
      )
    ].freeze
  end
end
