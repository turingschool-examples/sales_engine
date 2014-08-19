class Repository

  def self.all
    @collection
  end

  def self.random
    @collection[rand(@collection.size)]
  end

  def self.find_by_X(attribute)
    # X = attribute, returns a single case-insensitive match
    @collection.find do
      |element| element.call(attribute) == attribute
    end
  end

  def self.find_all_by_X(attribute)
    # find_by_X that returns a collection.if no match,returns []
    @collection.find_all do
      |element| element.call(attribute) == attribute
    end
  end

end
