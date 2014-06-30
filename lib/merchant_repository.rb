require 'csv'
require_relative 'entry_merchant'

class MerchantRepository


  def self.read(filename = 'test/fixtures/small_merchants.csv')
    new(CSV.open(filename, headers: true, header_converters: :symbol))
  end

  attr_reader :records

  def initialize(csv_records)
    @records = build_merchants(csv_records)
  end

  def build_merchants(data)
    data.collect do |row|
      Entry.new(row)
    end
  end

  def find_by_name(name)
    records.select {|entry| entry.name == name}.sort_by {|e| e.name}
  end

end

m = MerchantRepository.new('data/merchants.csv')
puts m
