require_relative 'merchant_repository'

class Merchant
  attr_accessor :id, :name, :created_at, :updated_at
  attr_reader :repo

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

  def revenue
    repo.calculate_total_revenue_by_merchant_id(id)
  end
end


