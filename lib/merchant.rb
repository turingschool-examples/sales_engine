class Merchant
  attr_accessor :id,
                :name,
                :created_at,
                :updated_at

  def initialize(data)
    @id          = data[:id]
    @name        = data[:name]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end

  def items
  end

  def invoices
  end

  def revenue
    #all revenues must be BigDecimal
  end

  def revenue(date_arg)
  end

  def favorite_customer
    #customer who has conducted the most successful transactions
  end

  def customers_with_pending_invoices
  end

end
