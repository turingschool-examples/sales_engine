require          'csv'
require_relative 'entry_invoices'

class InvoicesRepository

  def self.load
    data = CSV.open('test/fixtures/small_invoices.csv', headers: true, header_converters: :symbol)
    rows = data.map do |row|
      EntryInvoices.new(row)
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



end
