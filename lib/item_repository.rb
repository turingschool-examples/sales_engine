require_relative 'item'
require_relative 'parser'

class ItemRepository
  extend Parser

  def self.collection
    @collection ||= load_entries(Item, 'items.csv')
  end

end

