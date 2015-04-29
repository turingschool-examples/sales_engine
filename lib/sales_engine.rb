require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'
require_relative 'customer_repository'
require_relative 'invoice_repository'
require_relative 'load_data'
require 'bigdecimal/util'
require 'pry'

class SalesEngine
  include LoadData

  attr_reader :filepath

  def initialize(filepath = "fixtures")
    @filepath = filepath
  end

  def startup
    # Sally and Justin's Sales Engine!
  end

  def merchant_repository
    @merchant_repo ||=
      MerchantRepository.new(load_csv(filepath, "merchants.csv"), self)
  end

  def item_repository
    @item_repo ||=
      ItemRepository.new(load_csv(filepath, "items.csv"), self)
  end

  def invoice_repository
    @invoice_repo ||=
      InvoiceRepository.new(load_csv(filepath, "invoices.csv"), self)
  end

  def transaction_repository
    @transaction_repo ||=
      TransactionRepository.new(load_csv(filepath, "transactions.csv"), self)
  end

  def invoice_item_repository
    @invoice_item_repo ||=
      InvoiceItemRepository.new(load_csv(filepath, "invoice_items.csv"), self)
  end

  def customer_repository
    @customer_repo ||=
      CustomerRepository.new(load_csv(filepath, "customers.csv"), self)
  end

  def find_invoices_by_merchant_id(merchant_id)
    invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_invoice_items_with_invoices(id)
    invoice_item_repository.find_all_by_invoice_id(id)
  end

  def find_invoice_date_by_invoice_id(invoice_id)
    invoice_repository.find_by_id(invoice_id).created_at
  end

  def find_all_invoice_items_with_multiple_invoices(invoices)
    invoices.flat_map do |invoice|
      find_invoice_items_with_invoices(invoice.id)
    end
  end

  def calculate_revenue_of_invoice_items(invoice_items)
    invoice_items.reduce(0) do |sum, inv_item|
      sum + (inv_item.unit_price / 100) * inv_item.quantity
    end
  end

  def successful_invoices
    @successful_invoices ||=
      transaction_repository.successful_transactions.flat_map do |transaction|
        invoice_repository.find_all_by_id(transaction.invoice_id)
    end
  end

  def successful_invoice_items_by_item_id(item_id)
   invoice_item_repository.successful_invoice_items.select do |invoice_item|
     invoice_item.item_id == item_id
   end
  end

  def successful_invoices_by_merchant_id(merchant_id)
    successful_invoices.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def pending_invoices(merchant_id)
    invoices = find_invoices_by_merchant_id(merchant_id)
    successful_invoices = successful_invoices_by_merchant_id(merchant_id)
    invoices - successful_invoices
  end

  def customers_with_pending_invoices(merchant_id)
    customer_repository.customers_with_pending_invoices(merchant_id)
  end

  def successful_invoices_by_date(merchant_id, date)
    successful_invoices_by_merchant_id(merchant_id).select do |invoice|
      Date.parse(invoice.created_at) == date
    end
  end

  def add_invoice_items(items,invoice_data)
    invoice_item_repository.create_new_invoice_items(items, invoice_data)
  end
end


