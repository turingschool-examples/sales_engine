require_relative 'repository'
require_relative 'invoice'

class InvoiceRepository
  include Repository

  def initialize(invoices)
    @entries = invoices
    create_methods
  end

  def give_transactions_from(transaction_repository)
    entries.each do |invoice|
      invoice.give_transactions(transaction_repository.find_all_by_invoice_id(invoice.id))
    end
  end

  def give_invoice_items_from(invoice_item_repository)
    entries.each do |invoice|
      invoice_items = invoice_item_repository.find_all_by_invoice_id(invoice.id)
      invoice.give_invoice_items(invoice_items)
      invoice.give_items(invoice_items.collect(&:item))
    end
  end

  def give_customers_from(customer_repository)
    entries.each do |invoice|
      invoice.give_customer(customer_repository.find_by_id(invoice.customer_id))
    end
  end

  def give_merchants_from(merchant_repository)
    entries.each do |invoice|
      invoice.give_merchant(merchant_repository.find_by_id(invoice.merchant_id))
    end
  end

  def create(data)
    data[:merchant_id] = data[:merchant].id
    data[:customer_id] = data[:customer].id
    invoice = Invoice.new(data)
    invoice.give_customer data[:customer]
    invoice.give_items    data[:items]
    invoice.give_merchant data[:merchant]
    entries << invoice
    invoice
  end

  private

  def attributes
    %w(id customer_id merchant_id status created_at updated_at)
  end
end
