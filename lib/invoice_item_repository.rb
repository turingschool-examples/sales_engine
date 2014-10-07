require_relative 'repository'
require_relative 'invoice_item'

class InvoiceItemRepository < Repository

  def initialize
    @repo = []
  end

  def populate_repository(parsed_csv, InvoiceItem.new)
    parsed_csv.map do |hash|
      hash.map do |key, value|
        instance_class.key = value
      end
    end
  end

  def find_by_id(arg); finder(:id, arg); end
  def find_by_item_id(arg); finder(:item_id, arg); end
  def find_by_invoice_id(arg); finder(:invoice_id, arg); end
  def find_by_quantity(arg); finder(:quantity, arg); end
  def find_by_unit_price(arg); finder(:unit_price, arg); end
  def find_by_created_at(arg); finder(:created_at, arg); end
  def find_by_updated_at(arg); finder(:updated_at, arg); end

end
