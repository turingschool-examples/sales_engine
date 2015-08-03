require "csv"
require_relative "invoice"

class InvoiceRepository
  attr_accessor :invoices

  def make_invoices_array
    contents = CSV.open "./data/invoices.csv", headers: true, header_converters: :symbol

    @invoices = contents.map do |row|
      invoice               = Invoice.new
      invoice.id            = row[:id]
      invoice.customer_id   = row[:customer_id]
      invoice.merchant_id   = row[:merchant_id]
      invoice.status        = row[:status]
      invoice.created_at    = row[:created_at]
      invoice.updated_at    = row[:updated_at]
      invoice
    end
  end

  def random
    @invoices.sample
  end

  def find_by_id(id)
    @invoices.find { |invoice| invoice.id == id }
  end

  def find_all_by_id(id)
    @invoices.select { |invoice| invoice.id == id }
  end

  def find_by_customer_id(customer_id)
    @invoices.find { |invoice| invoice.customer_id == customer_id }
  end

  def find_all_by_customer_id(customer_id)
    @invoices.select { |invoice| invoice.customer_id == customer_id }
  end

  def find_by_merchant_id(merchant_id)
    @invoices.find { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_all_by_merchant_id(merchant_id)
    @invoices.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_by_status(status)
    @invoices.find { |invoice| invoice.status == status }
  end

  def find_all_by_status(status)
    @invoices.select { |invoice| invoice.status == status }
  end

  def find_by_created_at(created_at)
    @invoices.find { |invoice| invoice.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    @invoices.select { |invoice| invoice.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    @invoices.find { |invoice| invoice.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    @invoices.select { |invoice| invoice.updated_at == updated_at }
  end
end
