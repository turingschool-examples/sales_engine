require_relative 'repository'
require_relative 'item'

class ItemRepository < Repository
  attr_reader :repo

  def initialize
    @repo = items
  end

  def find_by_id(arg); find_by(:id, arg); end
  def find_by_name(arg); find_by(:name, arg); end
  def find_by_description(arg); find_by(:description, arg); end
  def find_by_unit_price(arg); find_by(:unit_price, arg); end
  def find_by_merchant_id(arg); find_by(:merchant_id, arg); end
  def find_by_created_at(arg); find_by(:created_at, arg); end
  def find_by_updated_at(arg); find_by(:updated_at, arg); end

  def most_revenue(arg)
  end

  def most_items(arg)
  end

end
