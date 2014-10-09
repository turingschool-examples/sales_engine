require_relative 'repository'
require_relative 'invoice'

class InvoiceRepository < Repository
  attr_reader :repo

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @repo = []
  end

  def inspect
    "#<#{self.class} #{@repo.size} rows>"
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

  def find_find_transaction_by_id(transaction_id)
    sales_engine.find_transaction_by_id(transaction_id)
  end

  def find_invoice_items_by_invoice_id(invoice_id)
    sales_engine.find_invoice_items(invoice_id)
  end

end
