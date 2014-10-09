require_relative 'repository'

class MerchantRepository
  include Repository

  def initialize(merchants)
    @entries = merchants
    create_methods
  end

  def give_items_from(item_repository)
    entries.each do |merchant|
      merchant.give_items(item_repository.find_all_by_merchant_id(merchant.id))
    end
  end

  def give_invoices_from(invoice_repository)
    entries.each do |merchant|
      merchant.give_invoices(invoice_repository.find_all_by_merchant_id(merchant.id))
    end
  end

  def most_items(top_x)
    most_by(top_x) { |merchant| merchant.items.size }
  end

  def most_revenue(top_x)
    most_by(top_x) { |merchant| merchant.revenue }
  end

  def most_by(top_x, &block)
    entries.sort_by{ |merchant| block.call(merchant) }.reverse[0, top_x]
  end

  def revenue(date)
    entries.reduce(0) do |sum, merchant|
      sum + merchant.revenue(date)
    end
  end

  private

  def attributes
    %w(id name created_at updated_at)
  end
end
