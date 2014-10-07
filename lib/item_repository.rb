require_relative 'repository'
require_relative 'item'

class ItemRepository < Repository

  attr_reader :repo

  def initialize
    @repo = []
  end

  def find_by_id(arg); finder(:id, arg); end
  def find_by_name(arg); finder(:name, arg); end
  def find_by_description(arg); finder(:description, arg); end
  def find_by_unit_price(arg); finder(:unit_price, arg); end
  def find_by_merchant_id(arg); finder(:merchant_id, arg); end
  def find_by_created_at(arg); finder(:created_at, arg); end
  def find_by_updated_at(arg); finder(:updated_at, arg); end

  def most_revenue(arg)
  end

  def most_items(arg)
  end

end
