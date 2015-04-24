require 'csv'
require_relative 'invoice'
require_relative 'sales_engine'

class InvoiceRepository
  attr_accessor :invoices
  attr_reader :engine

  def initialize(engine)
    @engine = engine
  end

  def load_data
    @invoices ||= create_invoices
  end

  def contents
    CSV.open "./fixtures/invoices.csv", headers: true, header_converters: :symbol
  end

  def create_invoices
    puts "READING INVOICE REPO"
    contents.map do |attributes|
      Invoice.new(attributes, self)
    end
  end

  def find_transactions_by_invoice_id(invoice_id)
    engine.transaction_repo.find_all_by_invoice_id(invoice_id)
  end

  def find_invoice_items_by_invoice_id(invoice_id)
    engine.invoice_item_repo.find_all_by_invoice_id(invoice_id)
  end

  def find_customer_by_customer_id(customer_id)
    engine.customer_repo.find_by_id(customer_id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    engine.merchant_repo.find_by_id(merchant_id)
  end

  def find_items_by_item_id_through_invoice_items(item_id)
    engine.item_repo.find_by_id(item_id)
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(id)
    invoices.find { |invoice| invoice.id == id }
  end

  def find_all_by_id(id)
    invoices.select { |invoice| invoice.id == id }
  end

  def find_by_customer_id(customer_id)
    invoices.find { |invoice| invoice.customer_id == customer_id }
  end

  def find_all_by_customer_id(customer_id)
    invoices.select { |invoice| invoice.customer_id == customer_id }
  end

  def find_by_merchant_id(merchant_id)
    invoices.find { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_all_by_merchant_id(merchant_id)
    invoices.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_by_status(status)
    invoices.find { |invoice| invoice.status == status }
  end

  def find_all_by_status(status)
    invoices.select { |invoice| invoice.status == status }
  end

  def find_by_created_at(created_at)
    invoices.find { |invoice| invoice.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    invoices.select { |invoice| invoice.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    invoices.find { |invoice| invoice.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    invoices.select { |invoice| invoice.updated_at == updated_at }
  end
end
