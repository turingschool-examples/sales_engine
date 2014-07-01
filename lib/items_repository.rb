require          'csv'
require_relative 'items_entry'

class ItemsRepository

  def self.load
    data = CSV.open('test/fixtures/small_items.csv', headers: true, header_converters: :symbol)
    rows = data.map do |row|
      EntryItems.new(row)
    end
    new(rows)
  end

  attr_reader :entries

  def initialize(entries)
    @entries = entries
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
