class SalesEngine
  attr_reader :item_repository, :merchant_repository

  def initialize
    @item_repository = ItemRepository.new(self)
    @merchant_repository = MerchantRepository.new(self)
  end



  def items_for_merchant_id(id)
    item_repository.find_all_by_merchant_id(id)
  end
end
