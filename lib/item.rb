require_relative 'sales_engine'

class Item
  attr_accessor :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize
    @id
    @name
    @description
    @unit_price
    @merchant_id
    @created_at
    @updated_at
  end

  def invoice_items
    engine = SalesEngine.new
    engine.invoice_item_repo.find_all_by_item_id(id)
  end

  def merchant
    engine = SalesEngine.new
    engine.merchant_repo.find_by_id(merchant_id)
  end
end
