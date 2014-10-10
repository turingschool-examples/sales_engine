require_relative 'repository'

class ItemRepository
  include Repository

  def initialize(items)
    @entries = items
    create_methods
  end

  def give_invoice_items_from(invoice_item_repo)
    entries.each do |item|
      item.give_invoice_items(invoice_item_repo.find_all_by_item_id(item.id))
    end
  end

  def give_merchants_from(merchant_repo)
    entries.each do |item|
      item.give_merchant(merchant_repo.find_by_id(item.merchant_id))
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
