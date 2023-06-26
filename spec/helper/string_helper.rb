# frozen_string_literal: true

module StringHelper
  def self.underscore(camel_cased_word)
    camel_cased_word
      .to_s
      .gsub('::', '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end
end
