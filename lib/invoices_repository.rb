require          'csv'
require_relative 'invoices_entry'

class InvoicesRepository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @entries << EntryInvoice.new(row)
    end
  end

  attr_reader :entries

  def initialize
    @entries = []
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
