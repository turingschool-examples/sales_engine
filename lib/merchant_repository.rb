require_relative 'repository'

class MerchantRepository
  include Repository

  def initialize(merchants)
    @entries = merchants
    create_methods
  end

  def set_relations(repositories)
    set_items(repositories[0])
    set_invoices(repositories[1])
  end

  def set_items(item_repo)
    entries.each do |merchant|
      merchant.assign_items(item_repo.find_all_by_merchant_id(merchant.id))
    end
  end

  def set_invoices(inv_repo)
    entries.each do |merchant|
      merchant.assign_invoices(inv_repo.find_all_by_merchant_id(merchant.id))
    end
  end

  def most_items(top_x)
    most_by(top_x, &:items_sold)
  end

  def most_revenue(top_x)
    most_by(top_x, &:revenue)
  end

  def revenue(date)
    entries.reduce(0) { |sum, merchant| sum + merchant.revenue(date) }
  end

  private

  def attributes
    %w(id name created_at updated_at)
  end
end
