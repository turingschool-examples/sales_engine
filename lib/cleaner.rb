module Cleaner

  def self.clean(attribute)
    clean_string(attribute) if attribute.is_a? String  # => "abcde123"
  end

  def self.clean_string(attribute)
    attribute.downcase              # => "abcde123"
  end

end
