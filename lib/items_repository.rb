require          'csv'
require_relative 'items_entry'
require_relative 'repository'

class ItemsRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @entries << EntryItems.new(row)
    end
  end

  attr_reader :entries

end
