module Repository

  def create_methods
    attributes.each do |attribute|
      define_singleton_method "find_by_#{attribute}" do |value|
        find_by(attribute, value)
      end

      define_singleton_method "find_all_by_#{attribute}" do |value|
        find_all_by(attribute, value)
      end
    end
  end

  def all
    entries
  end

  def random
    entries.sample
  end

  def inspect
    "<#{self.class} #{entries.size} rows>"
  end

  private
  attr_reader :entries

  def find_by(key, value)
    entries.find { |entry| entry.send(key.to_sym) == value }
  end

  def find_all_by(key, value)
    entries.select { |entry| entry.send(key.to_sym) == value }
  end

  def most_by(top_x, &block)
    entries.sort_by{ |entry| block.call(entry) }.reverse[0, top_x]
  end
end
