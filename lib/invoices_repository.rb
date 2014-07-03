require          'csv'
require_relative 'invoices_entry'
require_relative 'repository'

class InvoicesRepository < Repository

  def load(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @entries << EntryInvoice.new(row, self)
    end
  end


  def find_by_customer_id(customer_id)
    objects.detect { |entry| entry.customer_id == customer_id}
  end

  def find_all_by_customer_id(customer_id)
    objects.select { |entry| entry.customer_id == customer_id }.sort_by {|e| e.customer_id}
  end

  def find_by_merchant_id(merchant_id)
    objects.detect { |entry| entry.merchant_id == merchant_id}
  end


  def find_by_status(status)
    objects.detect { |entry| entry.status == status}
  end

  def find_all_by_status(status)
    objects.select { |entry| entry.status == status }.sort_by {|e| e.status}
  end
end
