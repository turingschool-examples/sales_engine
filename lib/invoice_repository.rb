require_relative 'repository'
require_relative 'invoice'

class InvoiceRepository
  include Repository

  def initialize(invoices)
    @entries = invoices
    create_methods
  end

  def set_relations(repositories)
    set_transactions(repositories[0])
    set_invoice_items(repositories[1])
    set_customers(repositories[2])
    set_merchants(repositories[3])
  end

  def set_transactions(trans_repo)
    entries.each do |invoice|
      invoice.assign_transactions(trans_repo.find_all_by_invoice_id(invoice.id))
    end
  end

  def set_invoice_items(invoice_item_repo)
    entries.each do |invoice|
      invoice_items = invoice_item_repo.find_all_by_invoice_id(invoice.id)
      invoice.assign_invoice_items(invoice_items)
      invoice.assign_items(invoice_items.collect(&:item))
    end
  end

  def set_customers(customer_repo)
    entries.each do |invoice|
      invoice.assign_customer(customer_repo.find_by_id(invoice.customer_id))
    end
  end

  def set_merchants(merchant_repo)
    entries.each do |invoice|
      invoice.assign_merchant(merchant_repo.find_by_id(invoice.merchant_id))
    end
  end

  def create(data)
    data[:merchant_id]    =  data[:merchant].id
    data[:customer_id]    =  data[:customer].id
    invoice               =  Invoice.new(data)
    invoice.assign_customer  data[:customer]
    invoice.assign_items     data[:items]
    invoice.assign_merchant  data[:merchant]
    entries[entries.size] = invoice
  end

  private

  def attributes
    %w(id customer_id merchant_id status created_at updated_at)
  end
end
