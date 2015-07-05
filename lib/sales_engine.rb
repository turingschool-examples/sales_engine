require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'
require_relative 'customer_repository'
require_relative 'invoice_repository'
require_relative 'load_data'

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

  def find_transactions_by_invoice_id(invoice_id)
    transaction_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_invoice_date_by_invoice_id(invoice_id)
    invoice_repository.find_by_id(invoice_id).created_at
  end

  def successful_transactions
    transaction_repository.successful_transactions
  end

  def successful_invoices
    invoice_repository.successful_invoices
  end

  def successful_invoice_items
    invoice_item_repository.successful_invoice_items
  end

  def customers_with_pending_invoices(invoice)
    customer_repository.customers_with_pending_invoices(invoice)
  end

  def add_invoice_items(items,invoice_data)
    invoice_item_repository.create_new_invoice_items(items, invoice_data)
  end

  def add_transaction(transaction_data)
    transaction_repository.create_new_transaction(transaction_data)
  end
end


