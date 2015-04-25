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
    merchant_repo
    item_repo
    invoice_repo
    transaction_repo
    invoice_item_repo
    customer_repo
  end

  def merchant_repo
    @merchant_repository ||= MerchantRepository.new(merchant_data(@filepath), self)
  end

  def item_repo
    @item_repository ||= ItemRepository.new(item_data(@filepath), self)
  end

  def invoice_repo
    @invoice_repository ||= InvoiceRepository.new(invoice_data(@filepath), self)
  end

  def transaction_repo
    @transaction_repository ||= TransactionRepository.new(transaction_data(@filepath), self)
  end

  def invoice_item_repo
    @invoice_item_repository ||= InvoiceItemRepository.new(invoice_item_data(@filepath), self)
  end

  def customer_repo
    @customer_repository ||= CustomerRepository.new(customer_data(@filepath), self)
  end

  def find_invoices_by_merchant_id(merchant_id)
    invoice_repo.find_all_by_merchant_id(merchant_id)
  end

  def find_invoice_items_by_invoice_ids(invoice_ids)
    invoice_ids.map { |inv_id| invoice_item_repo.find_all_by_invoice_id(inv_id) }
  end

  def calculate_revenue_of_invoice_items(invoice_items)
    invoice_items.reduce(0) { |sum, inv_item| sum + (inv_item.unit_price.to_d/100) * inv_item.quantity.to_i }
  end

  def format_big_decimal(number)
    number.round(2).to_digits
  end

  def merchant_revenue(merchant_id)
    inv_ids = find_invoices_by_merchant_id(merchant_id).map { |invoice| invoice.id }
    inv_items = find_invoice_items_by_invoice_ids(inv_ids)
    revenue = inv_items.map { |subarray| calculate_revenue_of_invoice_items(subarray) }.reduce(:+)
    format_big_decimal(revenue)
  end

  def merchant_revenue_for_specific_date(merchant_id, date)
    inv_id = invoice_repo.find_by_merchant_id(merchant_id).id
    inv_items = invoice_item_repo.find_all_by_invoice_id(inv_id)
    inv_items_by_date = inv_items.find_all_by_created_at(date)
    revenue = inv_items_by_date.reduce(0) { |sum, element| sum + (BigDecimal(element.unit_price) * element.quantity.to_i) }
    revenue.round(2).to_digits
  end
end


