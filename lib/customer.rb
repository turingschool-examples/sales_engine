class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id           = data[:id]
    @first_name   = data[:first_name]
    @last_name    = data[:last_name]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
    @repository   = repository
  end

  def invoices
    repository.find_invoices_by_id(self.id)
  end

  def transactions
  end

  def favorite_merchant
    #where customer has conducted the most successful transactions
  end

end
