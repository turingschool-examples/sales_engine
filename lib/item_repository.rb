class ItemRepository
  attr_reader :items
  attr_accessor :results

  def initialize(items)
      @items = items
      @results = []
  end

  def all
      @items
  end

  def random
      @items.sample
  end

  def find_by_id(value)
      @items.find do |item|
        item.id == value
      end
  end

  def find_by_name(value)
    @items.find do |item|
      item.name == value.downcase
  end
end
end