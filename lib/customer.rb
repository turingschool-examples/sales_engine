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

  def find_merchants_by_invoices
    invoices.map { |invoice| invoice.merchant }
  end

  def favorite_merchant
    find_merchants_by_invoices.max_by do |merchant|
      find_merchants_by_invoices.count(merchant)
    end
  end
end
