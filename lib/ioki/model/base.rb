# frozen_string_literal: true

require 'date'

module Ioki
  module Model
    class Base
      extend Ioki::Support::ModuleMixins

      class << self
        def class_instance_attribute_definitions
          @class_instance_attribute_definitions ||= {}
        end

        def deprecated_attribute(attribute, definition = {})
          attribute(attribute, definition.merge(deprecated: true))
        end

        def attribute(attribute, definition = {})
          raise ArgumentError, "#{self}##{attribute}" unless valid_definition?(definition)
          raise ArgumentError, "#{self}##{attribute} duplicate" if class_instance_attribute_definitions.key?(attribute)

          attribute = attribute.to_sym

          class_instance_attribute_definitions[attribute] ||= definition

          define_method :"#{attribute}" do
            deprecation_warning deprecated_attribute_message(attribute) if attribute_deprecated?(attribute)

            @_attributes[attribute]
          end

          define_method :"#{attribute}=" do |value, show_deprecation_warnings: true|
            if show_deprecation_warnings && attribute_deprecated?(attribute)
              deprecation_warning deprecated_attribute_message(attribute)
            end

            @_raw_attributes[attribute] = value
            @_attributes[attribute] = type_cast_attribute_value(attribute, value)
          end
        end

        def schema_path
          nil
        end

        def specification_scope
          nil
        end

        def unvalidated(unvalidated = false)
          @unvalidated = unvalidated
        end

        def unvalidated?
          @unvalidated
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
          ancestor_model_classes
            .collect(&:class_instance_attribute_definitions)
            .reduce(&:merge)
        end

        def base(class_name, item_class_name: nil)
          define_method :set_base_class do
            @_base_class_name = class_name
            @_item_class_name = item_class_name
          end
        end
      end

      attr_accessor :_raw_attributes, :_attributes, :_etag

      def initialize(raw_attributes = base_class.new, etag = nil, options = {})
        set_base_class if respond_to?(:set_base_class)

        @_initial_attributes = raw_attributes
        @_raw_attributes = if raw_attributes.is_a?(Hash)
                             (raw_attributes || {}).transform_keys(&:to_sym)
                           else
                             raw_attributes || base_class.new
                           end
        @_etag = etag
        @_options = options.dup
        @_options[:show_deprecation_warnings] = true if @_options[:show_deprecation_warnings].nil?

        output_deprecation_warnings(@_raw_attributes)
        reset_attributes!
      end

      def inspect
        "#{self.class.name}:#{object_id} @attributes=#{attributes_without_deprecated.inspect}"
      end

      def is_attribute?(attribute)
        self.class.attribute_definitions.key?(attribute.to_sym)
      end

      def set_attribute(attribute, value, show_deprecation_warnings: true)
        if is_attribute?(attribute)
          public_send("#{attribute}=", value, show_deprecation_warnings: show_deprecation_warnings)
        end
      end

      def attributes(**attributes)
        attributes.each { |a, v| set_attribute(a, v, show_deprecation_warnings: false) }

        attributes_without_deprecated
      end

      def attributes_without_deprecated
        if Ioki.config.ignore_deprecated_attributes
          @_attributes.reject { |attribute, _value| self.class.attribute_definitions[attribute][:deprecated] }
        else
          @_attributes
        end
      end

      def data
        return attributes if base_class == Hash

        case base_class.to_s
        when 'Array'
          _raw_attributes.map do |item|
            class_name = class_name_from_value_type(@_item_class_name, item)
            model_class = constantize_in_module(class_name)

            model_class.new(item, nil, show_deprecation_warnings: false)
          end
        else
          _raw_attributes
        end
      end

      def base_class
        Object.const_get(@_base_class_name || 'Hash')
      end

      def type_cast_attribute_value(attribute, value)
        type = self.class.attribute_definitions.dig(attribute, :type)
        class_name = self.class.attribute_definitions.dig(attribute, :class_name)

        class_name = class_name_from_value_type(class_name, value)

        model_class = constantize_in_module(class_name)

        return value unless type
        return value if value.nil?

        if type.is_a?(Array)
          case value
          when TrueClass, FalseClass
            value if type.include?(:boolean)
          when String
            value if type.include?(:string)
          when Integer
            value if type.include?(:integer)
          end
        else
          parse_as_type(type, value, model_class)
        end
      end

      # may get overridden in hard ways by subclasses. This default
      # implementation should bring us a long way.
      def serialize(usecase = :read)
        if !@_raw_attributes.is_a?(Hash)
          return @_raw_attributes.map { |object| object.serialize(usecase) } if @_raw_attributes.is_a?(Array)

          return @_raw_attributes
        end

        self.class.attribute_definitions.each_with_object({}) do |(attribute, definition), data|
          value = public_send(attribute)

          next unless Array(definition[:on]).include?(usecase)

          next if Ioki.config.ignore_deprecated_attributes && definition[:deprecated]

          next if definition.key?(:omit_if_nil_on) &&
                  Array(definition[:omit_if_nil_on]).include?(usecase) &&
                  value.nil?

          next if definition.key?(:omit_if_blank_on) &&
                  Array(definition[:omit_if_blank_on]).include?(usecase) &&
                  Ioki::Support.blank?(value)

          next if definition.key?(:omit_if_not_provided_on) &&
                  Array(definition[:omit_if_not_provided_on]).include?(usecase) &&
                  !@_initial_attributes.key?(attribute)

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
        return false unless other.respond_to?(:attributes)

        attributes == other.attributes
      end

      private

      def reset_attributes!
        @_attributes = {}
        return if !@_raw_attributes.is_a?(Hash)

        self.class.attribute_definitions.each do |attribute, definition|
          value = @_raw_attributes.key?(attribute) ? @_raw_attributes[attribute] : definition[:default]
          public_send("#{attribute}=", value, show_deprecation_warnings: false)
        end
      end

      def constantize_in_module(class_name)
        return nil if Ioki::Support.blank?(class_name)

        self.class.module_parent.const_get class_name
      end

      def class_name_from_value_type(class_name, value)
        return class_name unless class_name.is_a?(Array)
        return nil if value.nil?

        class_name_from_value_type = Support.camelize(value_type(value))

        return class_name_from_value_type if class_name.include?(class_name_from_value_type)

        nil
      end

      def value_type(value)
        return value.attributes[:type] if value.respond_to?(:attributes)

        value['type']
      end

      def parse_as_type(type, value, model_class)
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
            model_class.new(value, nil, show_deprecation_warnings: false)
          else
            value
          end
        when :array
          if value.respond_to?(:map) && model_class
            value.map do |el|
              el.is_a?(Hash) ? model_class.new(el, nil, show_deprecation_warnings: false) : el
            end
          else
            Array(value)
          end
        else
          raise "Unknown type #{type}"
        end
      end

      def deprecated_attribute_message(attribute)
        attribute_message = "The attribute `#{self.class.name}##{attribute}` is deprecated."

        replaced_by = self.class.class_instance_attribute_definitions.dig(attribute, :replaced_by)
        replaced_by_message = " Please use `#{self.class.name}##{replaced_by}` instead." if replaced_by

        "#{attribute_message}#{replaced_by_message}"
      end

      def attribute_deprecated?(attribute)
        self.class.class_instance_attribute_definitions.dig(attribute, :deprecated)
      end

      def output_deprecation_warnings(raw_attributes)
        return unless raw_attributes.is_a?(Hash)

        raw_attributes.each_key do |attribute|
          deprecation_warning deprecated_attribute_message(attribute) if attribute_deprecated?(attribute)
        end
      end

      def deprecation_warning(message)
        if defined?(Rails)
          deprecator.warn(message)
        else
          warn message
        end
      end

      def deprecator
        @deprecator ||= ActiveSupport::Deprecation.new('1.0', 'Ioki')
      end
    end
  end
end
