require 'csv'
require_relative "invoice_item"
require 'pry'

class InvoiceItemRepository
  attr_accessor :invoice_items

  def make_invoice_items_array
    contents = CSV.open "./data/invoice_items.csv", headers: true, header_converters: :symbol

    @invoice_items = contents.map do |row|
      item = InvoiceItem.new
      item.id = row[:id]
      item.item_id = row[:item_id]
      item.invoice_id = row[:invoice_id]
      item.quantity = row[:quantity]
      item.unit_price = row[:unit_price]
      item.created_at = row[:created_at]
      item.updated_at = row[:updated_at]
      item
    end
  end

  def random
    invoice_items.sample
  end

  def find_by_id(id)
    invoice_items.detect { |item| item.id == id }
  end

  def find_all_by_id(id)
    invoice_items.select { |item| item.id == id}
  end

  def find_by_item_id(item_id)
    invoice_items.detect { |item| item.item_id == item_id }
  end

  def find_all_by_item_id(item_id)
    invoice_items.select { |item| item.item_id == item_id}
  end

  def find_by_invoice_id(invoice_id)
    invoice_items.detect { |item| item.invoice_id == invoice_id }
  end

  def find_all_by_invoice_id(invoice_id)
    invoice_items.select { |item| item.invoice_id == invoice_id}
  end

  def find_by_quantity(quantity)
    invoice_items.detect { |item| item.quantity == quantity}
  end

  def find_all_by_quantity(quantity)
    invoice_items.select { |item| item.quantity == quantity}
  end

  def find_by_unit_price(unit_price)
    invoice_items.detect { |item| item.unit_price == unit_price}
  end

  def find_all_by_unit_price(unit_price)
    invoice_items.select { |item| item.unit_price == unit_price}
  end

  def find_by_created_at(created_at)
    invoice_items.detect { |item| item.created_at == created_at}
  end

  def find_all_by_created_at(created_at)
    invoice_items.select { |item| item.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    invoice_items.detect { |item| item.updated_at == updated_at}
  end

  def find_all_by_updated_at(updated_at)
    invoice_items.select { |item| item.updated_at == updated_at}
  end

end
