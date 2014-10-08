require_relative 'repository'
require_relative 'invoice_item'

class InvoiceItemRepository < Repository

  attr_reader :repo

  def initialize
    @repo = []
  end

  def find_by_id(arg); find_by(:id, arg); end
  def find_by_item_id(arg); find_by(:item_id, arg); end
  def find_by_invoice_id(arg); find_by(:invoice_id, arg); end
  def find_by_quantity(arg); find_by(:quantity, arg); end
  def find_by_unit_price(arg); find_by(:unit_price, arg); end
  def find_by_created_at(arg); find_by(:created_at, arg); end
  def find_by_updated_at(arg); find_by(:updated_at, arg); end

end
