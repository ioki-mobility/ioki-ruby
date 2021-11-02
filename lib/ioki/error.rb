# frozen_string_literal: true

require 'ioki/error/base'
require 'ioki/error/conflict'
require 'ioki/error/forbidden'
require 'ioki/error/internal_server_error'
require 'ioki/error/not_acceptable'
require 'ioki/error/not_found'
require 'ioki/error/not_modified'
require 'ioki/error/response_malformed'
require 'ioki/error/unauthorized'
require 'ioki/error/unexpected_redirection'
require 'ioki/error/unexpected_response_code'
require 'ioki/error/unprocessable_entity'

module Ioki
  module Error
    class << self
      def http_status_code_to_error_class(code)
        case code
        when 200..299
          nil
        when 304
          NotModified
        when 300..399
          UnexpectedRedirection
        when 401
          Unauthorized
        when 403
          Forbidden
        when 404
          NotFound
        when 409
          Conflict
        when 406
          NotAcceptable
        when 422
          UnprocessableEntity
        when 500
          InternalServerError
        else
          UnexpectedResponseCode
        end
      end
    end
  end
end
