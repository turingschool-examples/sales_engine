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

  def find_by_customer_id(customer_id)
    entries.detect { |entry| entry.customer_id == customer_id}
  end

  def find_all_by_customer_id(customer_id)
    entries.select { |entry| entry.customer_id == customer_id }.sort_by {|e| e.customer_id}
  end

  def find_by_merchant_id(merchant_id)
    entries.detect { |entry| entry.merchant_id == merchant_id}
  end

  def find_all_by_merchant_id(merchant_id)
    entries.select { |entry| entry.merchant_id == merchant_id }.sort_by {|e| e.merchant_id}
  end

  def find_by_status(status)
    entries.detect { |entry| entry.status == status}
  end

  def find_all_by_status(status)
    entries.select { |entry| entry.status == status }.sort_by {|e| e.status}
  end
end
