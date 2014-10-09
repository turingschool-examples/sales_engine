require 'bigdecimal'

module Cleaner

  def self.clean(attribute)
    return attribute unless attribute.is_a? String
    clean_string(attribute) if attribute.is_a? String
  end

  def self.clean_string(attribute)
    attribute.downcase
  end

end
