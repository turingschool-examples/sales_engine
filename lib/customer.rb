class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repo

  def initialize(attributes, repo)
    @repo       = repo
    @id         = attributes[:id].to_i
    @first_name = attributes[:first_name]
    @last_name  = attributes[:last_name]
    @created_at = attributes[:created_at]
    @updated_at = attributes[:updated_at]
  end

  def invoices
    repo.find_invoices_by_customer_id(id)
  end

  def transactions
    invoices.map { |invoice| invoice.transactions }
  end

  def favorite_merchant
    repo.find_favorite_merchant_by_customer_id(id)
  end
end
