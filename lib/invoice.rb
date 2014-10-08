class Invoice
  attr_accessor :id,
                :customer_id,
                :merchant_id,
                :status,
                :created_at,
                :updated_at

  def initialize(data)
    @id           = data[:id]
    @customer_id  = data[:customer_id]
    @merchant_id  = data[:merchant_id]
    @status       = data[:status]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
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
