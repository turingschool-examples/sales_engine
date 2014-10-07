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

  def give_merchant_from(merchant_repo)
    @entries.each do |item|
      item.give_merchant(merchant_repo.find_all_by_merchant_id(item.merchant_id))
    end
  end

  private

  def attributes
    %w(id name description unit_price merchant_id created_at updated_at)
  end
end
