# frozen_string_literal: true

module Ioki
  # These are methods which are adapted from ActiveSupport
  module Support
    # activesupport/lib/active_support/core_ext/string/inflections.rb
    # But it doesn't support uppercase_first_letter argument and inflections
    def camelize(term)
      string = term.to_s.sub(/^[a-z\d]*/) { |match| match.capitalize! || match }
      string.gsub!(%r{(?:_|(/))([a-z\d]*)}i) do
        word = Regexp.last_match(2)
        substituted = word.capitalize! || word
        Regexp.last_match(1) ? "::#{substituted}" : substituted
      end
      string
    end

    def underscore(camel_cased_word)
      camel_cased_word
        .to_s
        .gsub('::', '/')
        .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .tr('-', '_')
        .downcase
    end

    # activesupport/lib/active_support/core_ext/object/blank.rb
    def blank?(value)
      value.respond_to?(:empty?) ? !!value.empty? : !value
    end

    module_function :camelize, :underscore, :blank?

    module ModuleMixins
      # activesupport/lib/active_support/core_ext/module/introspection.rb
      def module_parent_name
        if defined?(@parent_name)
          @parent_name
        else
          parent_name = (name =~ /::[^:]+\z/) ? -Regexp.last_match.pre_match : nil
          @parent_name = parent_name unless frozen?
          parent_name
        end
      end

      # activesupport/lib/active_support/core_ext/module/introspection.rb
      def module_parent
        module_parent_name ? Object.const_get(module_parent_name) : Object
      end

      # activesupport/lib/active_support/core_ext/class/subclasses.rb
      def descendants
        ObjectSpace.each_object(singleton_class).reject do |k|
          k.singleton_class? || k == self
        end
      end
    end
  end
end
