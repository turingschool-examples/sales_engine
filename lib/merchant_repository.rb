require          'csv'
require_relative 'merchant_entry'
require_relative 'items_repository'
require_relative 'repository'

class MerchantRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @entries << EntryMerchant.new(row, self)
    end
  end

  attr_reader :entries

  def find_all_by_name(name)
    objects.select { |entry| entry.send(:name) == name }
  end

  def find_by_name(name)
    objects.detect { |entry| entry.name == name}
  end

  def randomize
    objects.shuffle.first
  end

  # def item
  #   entry = find_by_name(merchant_name)
  #   items.find_all_by_merchant_id(entry.id)
  # end


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
