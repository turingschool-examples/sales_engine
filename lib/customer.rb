class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :invoices

  def initialize(data)
    @id         = data[:id]
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def assign_invoices(invoices)
    @invoices = invoices
  end

  def transactions
    invoices.flat_map(&:transactions)
  end

  def sales_by_merchant
    invoices.select(&:successful?).group_by(&:merchant)
  end

  def favorite_merchant
    sales_by_merchant.max_by { |merchant, transactions| transactions.size }[0]
  end
end
