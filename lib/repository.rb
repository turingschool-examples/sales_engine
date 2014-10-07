module Repository
  attr_reader :entries

  attributes.each do |attribute|
    define_method "find_by_#{attribute}" do |value|
      find_by(__method__[8..-1], value)
    end

    define_method "find_all_by_#{attribute}" do |value|
      find_all_by(__method__[12..-1], value)
    end
  end

  def all
    entries
  end

  def random
    entries.sample
  end

  def find_by(key, value)
    entries.find { |entry| entry.send key.to_sym == value }
  end

  def find_all_by(key, value)
    entries.select { |entry| entry.send key.to_sym == value }
  end
end
