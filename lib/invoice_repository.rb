require_relative 'invoice'
require 'csv'
require 'pry'

class InvoiceRepository
  attr_reader :invoices,
              :engine,
              :data

  def initialize(data, engine)
    @engine   = engine
    @data     = data
    @invoices = create_invoices
  end

  def create_invoices
    data.map do |attributes|
      Invoice.new(attributes, self)
    end
  end

  def successful_invoices
    @successful_invoices ||=
      engine.successful_transactions.flat_map do |transaction|
        find_all_by_id(transaction.invoice_id)
      end
  end

  def create(attributes)
    invoice_data = {
      id:           add_id,
      customer_id:  attributes[:customer].id,
      merchant_id:  attributes[:merchant].id,
      status:       attributes[:status],
      created_at:   Time.new,
      updated_at:   Time.new
      }
    new_invoice = Invoice.new(invoice_data, self)
    invoices << new_invoice
    engine.add_invoice_items(attributes[:items], invoice_data)

    new_invoice
  end

  def add_transaction(attributes)
    engine.add_transaction(attributes)
  end

  def add_id
    (invoices.last.id) + 1
  end

  def inspect
    "#<#{self.class} #{invoices.size} rows>"
  end

  def find_transactions_by_invoice_id(invoice_id)
    engine.find_transactions_by_invoice_id(invoice_id)
  end

  def find_invoice_items_by_invoice_id(invoice_id)
    engine.invoice_item_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_customer_by_customer_id(customer_id)
    engine.customer_repository.find_by_id(customer_id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    engine.merchant_repository.find_by_id(merchant_id)
  end

  def find_items_by_item_id_through_invoice_items(item_id)
    engine.item_repository.find_by_id(item_id)
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(id)
    invoices.detect { |invoice| invoice.id == id }
  end

  def find_all_by_id(id)
    invoices.select { |invoice| invoice.id == id }
  end

  def find_by_customer_id(customer_id)
    invoices.detect { |invoice| invoice.customer_id == customer_id }
  end

  def find_all_by_customer_id(customer_id)
    invoices.select { |invoice| invoice.customer_id == customer_id }
  end

  def find_by_merchant_id(merchant_id)
    invoices.detect { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_all_by_merchant_id(merchant_id)
    invoices.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_by_status(status)
    invoices.detect { |invoice| invoice.status == status }
  end

  def find_all_by_status(status)
    invoices.select { |invoice| invoice.status == status }
  end

  def find_by_created_at(created_at)
    invoices.detect { |invoice| invoice.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    invoices.select { |invoice| invoice.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    invoices.detect { |invoice| invoice.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    invoices.select { |invoice| invoice.updated_at == updated_at }
  end
end
