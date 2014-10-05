require_relative 'item'
require_relative 'find_by_attribute'
require 'csv'

class ItemRepository
  include FindByAttribute

  attr_reader :instances # , :attributes

  def initialize(directory)
    file =    File.join(directory, 'items.csv')
    data =    CSV.open(file, headers: true, header_converters: :symbol)
    @instances =  data.map { |row| Item.new(row.to_hash, self) }
    # @attributes = instances[0].attributes
  end
end
