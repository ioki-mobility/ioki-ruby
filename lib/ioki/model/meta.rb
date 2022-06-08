# frozen_string_literal: true

module Ioki
  module Model
    class Meta
      attr_reader :page, :last_page

      def initialize(attributes)
        @page = attributes['page']
        @last_page = attributes['last_page']
      end
    end
  end
end
