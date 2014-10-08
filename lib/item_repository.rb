require_relative 'repository'
require_relative 'item'

class ItemRepository < Repository
  attr_reader :repo,
              :sales_engine

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @repo         = []
  end

  def inspect
    "#<#{self.class} #{@repo.size} rows>"
  end

  def find_by_id(arg); find_by(:id, arg); end
  def find_by_name(arg); find_by(:name, arg); end
  def find_by_description(arg); find_by(:description, arg); end
  def find_by_unit_price(arg); find_by(:unit_price, arg); end
  def find_by_merchant_id(arg); find_by(:merchant_id, arg); end
  def find_by_created_at(arg); find_by(:created_at, arg); end
  def find_by_updated_at(arg); find_by(:updated_at, arg); end

  def find_all_by_id(arg); find_all_by(:id, arg); end
  def find_all_by_name(arg); find_all_by(:name, arg); end
  def find_all_by_description(arg); find_all_by(:description, arg); end
  def find_all_by_unit_price(arg); find_all_by(:unit_price, arg); end
  def find_all_by_merchant_id(arg); find_all_by(:merchant_id, arg); end
  def find_all_by_created_at(arg); find_all_by(:created_at, arg); end
  def find_all_by_updated_at(arg); find_all_by(:updated_at, arg); end

  def find_merchant_by_id(merchant_id)
    sales_engine.find_merchant_by_id(merchant_id)
  end

  def find_invoice_items_by_item_id(item_id)
    sales_engine.find_invoice_items(item_id)
  end

  def most_revenue(arg)
  end

  def most_items(arg)
  end

end
