require          'csv' 
require_relative 'entry_merchant'

class MerchantRepository

  def self.load
    data = CSV.open('test/fixtures/small_merchants.csv', headers: true, header_converters: :symbol)
    rows = data.map do |row|
      EntryMerchant.new(row)
    end
    new(rows)
  end

  attr_reader :entries

  def initialize(entries)
    @entries = entries
  end

  def find_by_id(id)
    entries.select { |entry| entry.id == id }.sort_by {|e| e.id}
  end

  def find_all_by_name(name)
    entries.select { |entry| entry.send(:name) == name }#.sort_by {|e| e.name}
  end

  def find_by_name(name)
    entries.detect { |entry| entry.name == name}
  end

  def randomize
    entries.shuffle.first
  end


end


# def self.read(filename = 'test/fixtures/small_merchants.csv')
#   new(CSV.open(filename, headers: true, header_converters: :symbol))
# end
#
# attr_reader :records
#
# def initialize(csv_records)
#   @records = build_merchants(csv_records)
# end
#
# def build_merchants(data)
#   data.collect do |row|
#     Entry.new(row)
#   end
# end
#
# def find_by_name(name)
#   records.select {|entry| entry.name == name}.sort_by {|e| e.name}
# end
