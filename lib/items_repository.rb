require          'csv'
require_relative 'items_entry'

class ItemsRepository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @entries << EntryItems.new(row)
    end
  end

  attr_reader :entries

  def initialize
    @entries = []
  end

  def find_by_id(id)
    entries.select { |entry| entry.id == id }
  end

  def find_by_name(name)
    entries.detect { |entry| entry.name == name}
  end

  def find_by_unit_price(unit_price)
    entries.detect { |entry| entry.unit_price == unit_price}
  end

  def find_all_by_unit_price(unit_price)
    entries.select { |entry| entry.unit_price == unit_price }
  end

  def find_by_merchant_id(merchant_id)
    entries.detect { |entry| entry.merchant_id == merchant_id}
  end

  def find_all_by_merchant_id(merchant_id)
    entries.select { |entry| entry.merchant_id == merchant_id }
  end



end
