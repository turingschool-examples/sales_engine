require          'csv'
require_relative 'items'
require_relative 'repository'

class ItemRepository < Repository


  def self.load(filename)
    objects = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      objects << Item.new(row)
    end
    new(objects)
  end

  attr_reader :objects

end
