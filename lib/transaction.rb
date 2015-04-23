require_relative 'sales_engine'

class Transaction
  attr_accessor :id, :invoice_id, :cc_number, :cc_expiration_date, :result, :created_at, :updated_at

  def initialize
    @id
    @invoice_id
    @cc_number
    @cc_expiration_date
    @result
    @created_at
    @updated_at
  end

  def invoice
    engine = SalesEngine.new
    engine.invoice_repo.find_by_id(invoice_id)
  end
end
