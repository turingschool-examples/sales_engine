require          'csv'
require_relative 'items'
require_relative 'repository'

class ItemRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @objects << Item.new(row)
    end
  end

  attr_reader :objects

end
