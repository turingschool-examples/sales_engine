class Customer
  attr_accessor :id,
                :first_name,
                :last_name,
                :created_at,
                :updated_at

  def initialize
    @id
    @first_name
    @last_name
    @created_at
    @updated_at
  end

  def invoices
  end

  def transactions
  end

  def favorite_merchant
    #where customer has conducted the most successful transactions
  end

end
