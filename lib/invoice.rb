require 'pry'
require_relative 'sales_engine'

class Invoice
  attr_accessor :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize
    @id
    @customer_id
    @merchant_id
    @status
    @created_at
    @updated_at
  end

  def transactions
    engine = SalesEngine.new
    engine.transaction_repo.find_all_by_invoice_id(id)
  end

  def invoice_items
    engine = SalesEngine.new
    engine.invoice_item_repo.find_all_by_invoice_id(id)
  end

  def items
    engine = SalesEngine.new
    invoice_items.map do |element|
      engine.item_repo.find_by_id(element.item_id)
    end
  end

  def customer
    engine = SalesEngine.new
    engine.customer_repo.find_by_id(customer_id)
  end

  def merchant
    engine = SalesEngine.new
    engine.merchant_repo.find_by_id(merchant_id)
  end
end
