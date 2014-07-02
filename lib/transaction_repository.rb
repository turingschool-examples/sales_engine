require 'csv'
require_relative 'transaction_entry'

class TransactionRepository

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
    entries.select {|entry| entry.id == id}
  end

  def find_by_invoice_id(id)
    entries.detect { |entry| entry.invoice_id == id}
  end


  def find_all_invoice_id(id)
    entries.select { |entry| entry.invoice_id == id }
  end

end
