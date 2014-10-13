require_relative 'repository'

class ItemRepository
  include Repository

  def initialize(items)
    @entries = items
    create_methods
  end

  def set_relations(repositories)
    set_invoice_items(repositories[0])
    set_merchants(repositories[1])
  end

  def set_invoice_items(invoice_item_repo)
    entries.each do |item|
      item.assign_invoice_items(invoice_item_repo.find_all_by_item_id(item.id))
    end
  end

  def set_merchants(merchant_repo)
    entries.each do |item|
      item.assign_merchant(merchant_repo.find_by_id(item.merchant_id))
    end
  end

  def most_revenue(top_x)
    most_by(top_x, &:revenue)
  end

  def most_items(top_x)
    most_by(top_x, &:times_sold)
  end

  private

  def attributes
    %w(id name description unit_price merchant_id created_at updated_at)
  end
end
