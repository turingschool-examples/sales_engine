require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'
require_relative 'customer_repository'
require_relative 'invoice_repository'
require_relative 'load_data'
require 'bigdecimal'
require 'bigdecimal/util'
require 'pry'

class SalesEngine
  include LoadData

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
    @merchant_repository ||= MerchantRepository.new(merchant_data(@filepath), self)
  end

  def item_repository
    @item_repository ||= ItemRepository.new(item_data(@filepath), self)
  end

  def invoice_repository
    @invoice_repository ||= InvoiceRepository.new(invoice_data(@filepath), self)
  end

  def transaction_repository
    @transaction_repository ||= TransactionRepository.new(transaction_data(@filepath), self)
  end

  def invoice_item_repository
    @invoice_item_repository ||= InvoiceItemRepository.new(invoice_item_data(@filepath), self)
  end

  def customer_repository
    @customer_repository ||= CustomerRepository.new(customer_data(@filepath), self)
  end

  def find_invoices_by_merchant_id(merchant_id)
    invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_invoice_items_with_invoices(id)
    invoice_item_repository.find_all_by_invoice_id(id)
  end

  def calculate_revenue_of_invoice_items(invoice_items)
    invoice_items.reduce(0) { |sum, inv_item| sum + inv_item.unit_price * inv_item.quantity }
  end

  def format_big_decimal(number)
    (number/100).to_digits.to_f
  end

  def successful_invoices
    transaction_repository.successful_transactions.map do |transaction|
      invoice_repository.find_all_by_id(transaction.invoice_id)
    end.flatten
  end

  def successful_invoices_by_merchant_id(merchant_id)
    successful_invoices.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def merchant_revenue(merchant_id)
    inv_items = successful_invoices_by_merchant_id(merchant_id)
    x = inv_items.map do |invoice|
      find_invoice_items_with_invoices(invoice.id)
    end.flatten
    number = calculate_revenue_of_invoice_items(x)
    format_big_decimal(number)
  end

  def merchant_fave_customer(merchant_id)
    customers = successful_invoices_by_merchant_id(merchant_id).map { |invoice| invoice.customer }
    customers.max_by { |customer| customers.count(customer) }
  end
end


