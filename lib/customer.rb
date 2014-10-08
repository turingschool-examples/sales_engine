class Customer
  attr_accessor :id,
                :first_name,
                :last_name,
                :created_at,
                :updated_at

  def initialize(data)
    @id           = data[:id]
    @first_name   = data[:first_name]
    @last_name    = data[:last_name]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
  end

  def invoices
  end

  def transactions
  end

  def favorite_merchant
    #where customer has conducted the most successful transactions
  end

end
