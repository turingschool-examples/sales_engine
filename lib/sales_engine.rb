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

  def find_invoice_items_by_invoice_ids(invoice_ids)
    invoice_ids.map { |inv_id| invoice_item_repository.find_all_by_invoice_id(inv_id) }
  end

  def calculate_revenue_of_invoice_items(invoice_items)
    invoice_items.reduce(0) { |sum, inv_item| sum + inv_item.unit_price * inv_item.quantity }
  end

  def format_big_decimal(number)
    (number/100).to_digits.to_f
  end

  def merchant_revenue(merchant_id)
    inv_ids = find_invoices_by_merchant_id(merchant_id).map { |invoice| invoice.id }
    inv_items = find_invoice_items_by_invoice_ids(inv_ids)
    revenue = inv_items.map { |subarray| calculate_revenue_of_invoice_items(subarray) }.reduce(:+)
    format_big_decimal(revenue)
  end

  def merchant_revenue_for_specific_date(merchant_id, date)
    inv_id = invoice_repository.find_by_merchant_id(merchant_id).id
    inv_items = invoice_item_repository.find_all_by_invoice_id(inv_id)
    inv_items_by_date = inv_items.find_all_by_created_at(date)
    revenue = inv_items_by_date.reduce(0) { |sum, element| sum + (BigDecimal(element.unit_price) * element.quantity.to_i) }
    revenue.round(2).to_digits
  end
end


