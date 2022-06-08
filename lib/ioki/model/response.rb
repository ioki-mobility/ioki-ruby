# frozen_string_literal: true

require_relative 'meta'

module Ioki
  module Model
    class Response
      attr_reader :data, :meta

      def initialize(data, meta)
        @data = data
        @meta = Ioki::Model::Meta.new(meta)
      end
    end
  end
end
