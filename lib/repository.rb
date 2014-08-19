class Repository

  def self.all
    @collection
  end

  def self.random
    @collection[rand(@collection.size)]
  end

  def self.find_by_X(attribute)
    # X = attribute, returns a single case-insensitive match
    @collection.find_by(:name, "Bob")
  end

  def self.find_all_by_X(attribute)
    return [] if f.nil?
    # find_by_X that returns a collection.if no match,returns []
    f = @collection.select(:name, "Bob")
  end

end
