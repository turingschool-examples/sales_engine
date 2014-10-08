require_relative 'repository'
require_relative 'merchant'

class MerchantRepository < Repository
  attr_reader :repo

  def initialize
    @repo = merchants
  end

  def find_by_id(arg); find_by(:id, arg); end
  def find_by_name(arg); find_by(:name, arg); end
  def find_by_created_at(arg); find_by(:created_at, arg); end
  def find_by_updated_at(arg); find_by(:updated_at, arg); end

  def most_revenue(arg)
  end

  def most_items(arg)
  end

  def revenue(date, arg)
  end

end
