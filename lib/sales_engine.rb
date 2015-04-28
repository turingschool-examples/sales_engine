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
    startup
  end

  def startup
    merchant_repository
    item_repository
    invoice_repository
    transaction_repository
    invoice_item_repository
    customer_repository
  end

  def merchant_repository
    @merchant_repository ||=
      MerchantRepository.new(merchant_data(filepath), self)
  end

  def item_repository
    @item_repository ||=
      ItemRepository.new(item_data(filepath), self)
  end

  def invoice_repository
    @invoice_repository ||=
      InvoiceRepository.new(invoice_data(filepath), self)
  end

  def transaction_repository
    @transaction_repository ||=
      TransactionRepository.new(transaction_data(filepath), self)
  end

  def invoice_item_repository
    @invoice_item_repository ||=
      InvoiceItemRepository.new(invoice_item_data(filepath), self)
  end

  def customer_repository
    @customer_repository ||=
      CustomerRepository.new(customer_data(filepath), self)
  end

  def find_invoices_by_merchant_id(merchant_id)
    invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_invoice_items_with_invoices(id)
    invoice_item_repository.find_all_by_invoice_id(id)
  end

  def find_all_invoice_items_with_multiple_invoices(invoices)
    invoices.map do |invoice|
      find_invoice_items_with_invoices(invoice.id)
    end.flatten
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

  def successful_invoices_by_merchant_id(merchant_id)
    successful_invoices.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def pending_invoices(merchant_id)
    invoices = find_invoices_by_merchant_id(merchant_id)
    successful_invoices = successful_invoices_by_merchant_id(merchant_id)
    invoices - successful_invoices
  end

  def find_all_customers_by_invoice_customer_id(invoice)
    customer_repository.find_all_by_id(invoice.customer_id)
  end

  def customers_with_pending_invoices(merchant_id)
    pending_invoices(merchant_id).flat_map do |invoice|
      find_all_customers_by_invoice_customer_id(invoice)
    end
  end

  def successful_invoices_by_date(merchant_id, date)
    successful_invoices_by_merchant_id(merchant_id).select do |invoice|
      Date.parse(invoice.created_at) == date
    end
  end

  def date?(merchant_id, date)
    if date.nil?
      successful_invoices_by_merchant_id(merchant_id)
    else
      successful_invoices_by_date(merchant_id, date)
    end
  end

  def merchant_revenue(merchant_id, date = nil)
    invoices = date?(merchant_id, date)
    invoice_items = find_all_invoice_items_with_multiple_invoices(invoices)
    calculate_revenue_of_invoice_items(invoice_items)
  end

  def merchant_fave_customer(merchant_id)
    customers = successful_invoices_by_merchant_id(merchant_id).map do |invoice|
      invoice.customer
    end
    customers.max_by { |customer| customers.count(customer) }
  end

  def best_day_for_item(item_id)
    invoice_items = invoice_item_repository.find_all_by_item_id(item_id)
    invoice_item = invoice_items.max_by { |invoice_item| invoice_item.quantity }
    Date.parse(invoice_repository.find_by_id(invoice_item.invoice_id).created_at)
  end

  def customer_fave_merchant(customer_id)
    merchants = invoice_repository.find_all_by_customer_id(customer_id).map do |invoice|
      invoice.merchant
    end
    merchants.max_by { |merchant| merchants.count(merchant) }
  end
end


