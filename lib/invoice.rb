class Invoice
  attr_accessor :id,
                :customer_id,
                :merchant_id,
                :status,
                :created_at,
                :updated_at

  def initialize
    @id
    @customer_id
    @merchant_id
    @status
    @created_at
    @updated_at
  end

  def transactions
  end

  def invoice_items
  end

  def items
  end

  def customer
  end

  def merchant
  end

end
