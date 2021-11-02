# frozen_string_literal: true

require 'date'

module Ioki
  module Model
    class Base
      class << self
        def class_instance_attribute_definitions
          @class_instance_attribute_definitions ||= {}
        end

        def attribute(attribute, definition = {})
          raise ArgumentError, "#{self}##{attribute}" unless valid_definition?(definition)

          attribute = attribute.to_sym

          class_instance_attribute_definitions[attribute] ||= definition

          define_method :"#{attribute}" do
            @_attributes[attribute]
          end

          define_method :"#{attribute}=" do |value|
            @_raw_attributes[attribute] = value
            @_attributes[attribute] = type_cast_attribute_value(attribute, value)
          end
        end

        def ancestor_model_classes
          ancestors.select { |k| k <= Ioki::Model::Base }.reverse
        end

        def valid_definition?(definition)
          definition.key?(:on) &&
            (Array(definition[:omit_if_nil_on]) - Array(definition[:on])).empty? &&
            (Array(definition[:omit_if_blank_on]) - Array(definition[:on])).empty?
        end

        def attribute_definitions
          ancestor_model_classes.
            collect(&:class_instance_attribute_definitions).
            reduce(&:merge)
        end
      end

      attr_accessor :_raw_attributes, :_attributes, :_etag

      def initialize(raw_attributes = {}, etag = nil)
        @_raw_attributes = raw_attributes.transform_keys(&:to_sym)
        @_etag = etag
        reset_attributes!
      end

      def inspect
        "#{self.class.name}:#{object_id} @attributes=#{@_attributes.inspect}"
      end

      def is_attribute?(attribute)
        self.class.attribute_definitions.key?(attribute.to_sym)
      end

      def set_attribute(attribute, value)
        public_send("#{attribute}=", value) if is_attribute?(attribute)
      end

      def attributes(**attributes)
        attributes.each { |a, v| set_attribute(a, v) }
        @_attributes
      end

      def type_cast_attribute_value(attribute, value)
        type = self.class.attribute_definitions.dig(attribute, :type)
        model_class = self.class.attribute_definitions.dig(attribute, :model_class)

        return value unless type
        return value if value.nil?

        case type
        when :string
          value.to_s
        when :integer
          value.to_i
        when :float
          value.to_f
        when :boolean
          [true, 'true', 't', 1, '1'].include?(value)
        when :date_time
          begin
            value.is_a?(String) ? DateTime.parse(value) : value
          rescue ArgumentError
            nil
          end
        when :object
          if value.is_a?(Hash) && model_class
            model_class.new(value)
          else
            value
          end
        when :array
          if value.respond_to?(:map) && model_class
            value.map do |el|
              el.is_a?(Hash) ? model_class.new(el) : el
            end
          else
            Array(value)
          end
        else
          raise "Unknown type #{type}"
        end
      end

      # may get overridden in hard ways by subclasses. This default
      # implementation should bring us a long way.
      def serialize(usecase = :read)
        self.class.attribute_definitions.each_with_object({}) do |(attribute, definition), data|
          value = public_send(attribute)

          next unless Array(definition[:on]).include?(usecase)

          next if definition.key?(:omit_if_nil_on) &&
                  Array(definition[:omit_if_nil_on]).include?(usecase) &&
                  value.nil?

          next if definition.key?(:omit_if_blank_on) &&
                  Array(definition[:omit_if_blank_on]).include?(usecase) &&
                  blank?(value)

          data[attribute] = if definition[:type] == :object && value.is_a?(Ioki::Model::Base)
                              value.serialize(usecase)
                            elsif definition[:type] == :array && value.respond_to?(:map)
                              value.map { |el| el.is_a?(Ioki::Model::Base) ? el.serialize(usecase) : el }
                            else
                              value
                            end
        end
      end

      def ==(other)
        attributes == other.attributes
      end

      private

      def reset_attributes!
        @_attributes = {}
        self.class.attribute_definitions.each do |attribute, definition|
          value = @_raw_attributes.key?(attribute) ? @_raw_attributes[attribute] : definition[:default]
          public_send("#{attribute}=", value)
        end
      end

      def blank?(value)
        value.respond_to?(:empty?) ? !!value.empty? : !value
      end
    end
  end
end
