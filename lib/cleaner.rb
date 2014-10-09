require 'bigdecimal'

module Cleaner

  def self.clean(attribute)
    return attribute if attribute.is_a? Integer
    attribute.to_f if attribute.is_a? BigDecimal
    clean_string(attribute) if attribute.is_a? String
  end

  def self.clean_string(attribute)
    attribute.downcase
  end

end
