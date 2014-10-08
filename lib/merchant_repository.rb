require_relative 'repository'
require_relative 'merchant'

class MerchantRepository < Repository
  attr_reader :repo

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @repo = []
  end

  def inspect
    "#<#{self.class} #{@repo.size} rows>"
  end

  def find_by_id(arg); find_by(:id, arg); end
  def find_by_name(arg); find_by(:name, arg); end
  def find_by_created_at(arg); find_by(:created_at, arg); end
  def find_by_updated_at(arg); find_by(:updated_at, arg); end

  def find_all_by_id(arg); find_all_by(:id, arg); end
  def find_all_by_name(arg); find_all_by(:name, arg); end
  def find_all_by_created_at(arg); find_all_by(:created_at, arg); end
  def find_all_by_updated_at(arg); find_all_by(:updated_at, arg); end

  def find_items_by_id(id)
    sales_engine.find_items_by_id(id)
  end

  def find_invoices_by_id(invoice_id)
    sales_engine.find_invoices_by_id(invoice_id)
  end

  def most_revenue(arg)
  end

  def most_items(arg)
  end

  def revenue(date, arg)
  end

end
