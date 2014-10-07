require_relative 'repository'

class MerchantRepository
  include Repository

  def initialize(merchants)
    @entries = merchants
    create_methods
  end

  def give_item_from(item_repository)
    entries.each do |merchant|
      merchant.give_items(item_repository.find_all_by_merchant_id(merchant.id))
    end
  end

  private

  def attributes
    %w(id name created_at updated_at)
  end
end
