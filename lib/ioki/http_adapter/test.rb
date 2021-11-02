# frozen_string_literal: true

module Ioki
  module HttpAdapter
    class Test < Ioki::HttpAdapter::Base
      def self.perform_request(_method, _url, _body, _headers)
        OpenStruct.new(
          status:  200,
          body:    '',
          headers: []
        )
      end
    end
  end
end
