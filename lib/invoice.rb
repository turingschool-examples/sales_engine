class Invoice
  attr_reader :id,
              :repository,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(data, repository)
    @id           = data[:id]
    @customer_id  = data[:customer_id]
    @merchant_id  = data[:merchant_id]
    @status       = data[:status]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
    @repository   = repository
  end

  def transactions
    repository.find_transaction_by_id(self.id)
  end

  def invoice_items
    repository.find_invoice_items_by_invoice_id(self.id)
  end

  def items
  end

  def customer
  end

  def merchant
  end

end
