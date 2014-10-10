require_relative 'repository'

class ItemRepository
  include Repository

  def initialize(items)
    @entries = items
    create_methods
  end

  def give_invoice_items_from(invoice_item_repo)
    @entries.each do |item|
      item.give_invoice_items(invoice_item_repo.find_all_by_item_id(item.id))
    end
  end

  def give_merchants_from(merchant_repo)
    @entries.each do |item|
      item.give_merchant(merchant_repo.find_by_id(item.merchant_id))
    end
  end

  def items
    @entries
  end

  def most_revenue(top_x)
    @entries.sort_by { |item| item.revenue }.reverse[0, top_x]
  end

  def most_items(top_x)
    @entries.sort_by { |item| item.times_sold }[0, top_x]
  end

  private

  def attributes
    %w(id name description unit_price merchant_id created_at updated_at)
  end
end
