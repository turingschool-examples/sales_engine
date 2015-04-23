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
end
