require 'csv'
require_relative 'entry_transaction'

class TransactionRepository

  def self.load
    data = CSV.open('test/fixtures/small_transaction.csv', headers: true, header_converters: :symbol)
    rows = data.map do |row|
      EntryTransaction.new(row)
    end
    new(rows)
  end

  attr_reader :entries

  def initialize(entries)
    @entries = entries
  end

  def find_by_id(id)
    entries.select {|entry| entry.id == id}
  end

  def find_by_invoice_id(id)
    entries.detect { |entry| entry.invoice_id == id}
  end

  def find_all_invoice_id(id)
    entries.select { |entry| entry.invoice_id == id }
  end

end
