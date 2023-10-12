# frozen_string_literal: true

module Ioki
  module Model
    class Meta
      attr_reader :count, :page, :last_page, :total_pages

      def initialize(attributes)
        @count = attributes['count']
        @page = attributes['page']
        @last_page = attributes['last_page']
        @total_pages = attributes['total_pages']
      end
    end
  end
end
