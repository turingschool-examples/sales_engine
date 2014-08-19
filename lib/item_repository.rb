require_relative 'item'
require_relative 'repository'
require_relative 'parser'

class ItemRepository < Repository
  extend Parser

  def self.collection
    @collection ||= load_entries(Item, 'items.csv')
  end

end
