require_relative 'repository'
require_relative 'invoice_item'

class InvoiceItemRepository < Repository

  attr_reader :repo

  def initialize
    @repo = []
  end

  def find_by_id(arg); finder(:id, arg); end
  def find_by_item_id(arg); finder(:item_id, arg); end
  def find_by_invoice_id(arg); finder(:invoice_id, arg); end
  def find_by_quantity(arg); finder(:quantity, arg); end
  def find_by_unit_price(arg); finder(:unit_price, arg); end
  def find_by_created_at(arg); finder(:created_at, arg); end
  def find_by_updated_at(arg); finder(:updated_at, arg); end

endaw4
