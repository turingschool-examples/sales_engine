require_relative 'sales_engine'

class Customer
  attr_accessor :id, :first_name, :last_name, :created_at, :updated_at

  def initialize
    @id
    @first_name
    @last_name
    @created_at
    @updated_at
  end

  def invoices
    engine = SalesEngine.new
    engine.invoice_repo.find_all_by_customer_id(id)
  end
end
