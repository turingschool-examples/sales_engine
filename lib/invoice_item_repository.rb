require_relative 'repository'
require_relative 'invoice_item'

class InvoiceItemRepository < Repository

  attr_reader :repository, :sales_engine, :filepath

  def initialize(sales_engine, filepath)
    @sales_engine = sales_engine
    @repository = []
    @filepath = filepath
  end

  def inspect
    "#<#{self.class} #{@repository.size} rows>"
  end

  def find_by_id(arg); find_by(:id, arg); end
  def find_by_item_id(arg); find_by(:item_id, arg); end
  def find_by_invoice_id(arg); find_by(:invoice_id, arg); end
  def find_by_quantity(arg); find_by(:quantity, arg); end
  def find_by_unit_price(arg); find_by(:unit_price, arg); end
  def find_by_created_at(arg); find_by(:created_at, arg); end
  def find_by_updated_at(arg); find_by(:updated_at, arg); end

  def find_all_by_id(arg); find_all_by(:id, arg); end
  def find_all_by_item_id(arg); find_all_by(:item_id, arg); end
  def find_all_by_invoice_id(arg); find_all_by(:invoice_id, arg); end
  def find_all_by_quantity(arg); find_all_by(:quantity, arg); end
  def find_all_by_unit_price(arg); find_all_by(:unit_price, arg); end
  def find_all_by_created_at(arg); find_all_by(:created_at, arg); end
  def find_all_by_updated_at(arg); find_all_by(:updated_at, arg); end

  def make_repo
    populate_repository("#{filepath}/invoice_items.csv", InvoiceItem)
  end

  def find_invoice_by_id(invoice_id)
    sales_engine.find_invoice_by_id(invoice_id)
  end

  def find_item_by_id(item_id)
    sales_engine.find_item_by_id(item_id)
  end

  def random
    repository.sample
  end
end
