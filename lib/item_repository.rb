require_relative 'item'
require_relative 'finder_methods'
require 'csv'

class ItemRepository
  include FinderMethods

  attr_reader :instances

  def initialize(directory)
    file =    File.join(directory, 'items.csv')
    data =    CSV.open(file, headers: true, header_converters: :symbol)
    @instances =  data.map { |row| Item.new(row.to_hash, self) }
  end
end
