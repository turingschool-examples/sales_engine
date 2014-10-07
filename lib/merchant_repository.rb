require_relative 'repository'
require_relative 'merchant'

class MerchantRepository < Repository

  attr_reader :repo

  def initialize
    @repo = []
  end

  def find_by_id(arg); finder(:id, arg); end
  def find_by_name(arg); finder(:name, arg); end
  def find_by_created_at(arg); finder(:created_at, arg); end
  def find_by_updated_at(arg); finder(:updated_at, arg); end

  def most_revenue(arg)
  end

  def most_items(arg)
  end

  def revenue(date, arg)
  end

end
