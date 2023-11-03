# frozen_string_literal: true

module Ioki
  module Model
    class Meta
      attr_reader :total_count, :page, :last_page, :total_pages

      def initialize(attributes)
        @total_count = attributes['total_count']
        @page = attributes['page']
        @last_page = attributes['last_page']
        @total_pages = attributes['total_pages']
      end
    end
  end
end
