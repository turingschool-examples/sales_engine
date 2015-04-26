class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo

  def initialize(attributes, repo)
    @repo       = repo
    @id         = attributes[:id].to_i
    @name       = attributes[:name]
    @created_at = attributes[:created_at]
    @updated_at = attributes[:updated_at]
  end

  def items
    repo.find_all_items_by_merchant_id(id)
  end

  def invoices
    repo.find_all_invoices_by_merchant_id(id)
  end

  def revenue(date = nil)
    repo.calculate_total_revenue_by_merchant_id(id, date)
  end

  def favorite_customer
    repo.find_favorite_customer_by_merchant_id(id)
  end

  def customers_with_pending_invoices
    repo.pending_invoices(id)
  end
end


