require 'csv'
require_relative 'customer_entry'

class CustomerRepository

  def self.load
    data = CSV.open('test/fixtures/small_customers.csv', headers: true, header_converters: :symbol)
    rows = data.map do |row|
      CustomerEntry.new(row)
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

  def find_by_first_name(name)
    entries.detect { |entry| entry.first_name == name }
  end

  def find_all_first_name(name)
    entries.select { |entry| entry.first_name == name }
  end

  def find_by_last_name(name)
    entries.detect { |entry| entry.last_name == name }
  end

  def find_all_last_name(name)
    entries.select { |entry| entry.last_name == name }
  end

  def randomize
    entries.shuffle.first
  end
end
