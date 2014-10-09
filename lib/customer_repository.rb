require_relative 'repository'
require_relative 'customer'

class CustomerRepository < Repository
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
  def find_by_first_name(arg); find_by(:first_name, arg); end
  def find_by_last_name(arg); find_by(:last_name, arg); end
  def find_by_created_at(arg); find_by(:created_at, arg); end
  def find_by_updated_at(arg); find_by(:updated_at, arg); end

  def find_all_by_id(arg); find_all_by(:id, arg); end
  def find_all_by_first_name(arg); find_all_by(:first_name, arg); end
  def find_all_by_last_name(arg); find_all_by(:last_name, arg); end
  def find_all_by_created_at(arg); find_all_by(:created_at, arg); end
  def find_all_by_updated_at(arg); find_all_by(:updated_at, arg); end

  def populate
    populate_repository('/path/csv', Customer)
  end

  def find_invoices_by_id(invoice_id)
    sales_engine.find_invoices_by_id(invoice_id)
  end
end
