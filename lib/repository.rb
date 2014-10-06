module Repository
  attr_reader :entries

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
