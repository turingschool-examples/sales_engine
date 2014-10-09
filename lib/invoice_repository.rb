require_relative 'repository'
require_relative 'invoice'

class InvoiceRepository < Repository
  attr_reader :repository, :sales_engine, :filepath

  def initialize(sales_engine, filepath)
    @sales_engine = sales_engine
    @repository = []
    @filepath = filepath
  end

  def inspect
    "#<#{self.class} #{@repository.size} rows>"
  end

  def make_repo
    populate_repository("#{filepath}/invoices.csv", Invoice)
  end

  def find_by_id(arg); find_by(:id, arg); end
  def find_by_customer_id(arg); find_by(:customer_id, arg); end
  def find_by_merchant_id(arg); find_by(:merchant_id, arg); end
  def find_by_status(arg); find_by(:status, arg); end
  def find_by_created_at(arg); find_by(:created_at, arg); end
  def find_by_updated_at(arg); find_by(:updated_at, arg); end

  def find_all_by_id(arg); find_all_by(:id, arg); end
  def find_all_by_customer_id(arg); find_all_by(:customer_id, arg); end
  def find_all_by_merchant_id(arg); find_all_by(:merchant_id, arg); end
  def find_all_by_status(arg); find_all_by(:status, arg); end
  def find_all_by_created_at(arg); find_all_by(:created_at, arg); end
  def find_all_by_updated_at(arg); find_all_by(:updated_at, arg); end

  def find_transaction_by_id(transaction_id)
    sales_engine.find_transaction_by_id(transaction_id)
  end

  def find_invoice_items_by_invoice_id(invoice_id)
    sales_engine.find_invoice_items(invoice_id)
  end

  def find_items_by_invoice_id(item_id)
    sales_engine.find_item_by_id(item_id)
  end

  def find_customer_by_id(customer_id)
    sales_engine.find_customer_by_id(customer_id)
  end

  def find_merchant_by_id(merchant_id)
    sales_engine.find_merchant_by_id(merchant_id)
  end

  def random
    repository.sample
  end
end
