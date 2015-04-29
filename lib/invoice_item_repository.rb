require_relative 'invoice_item'
require 'csv'

class InvoiceItemRepository
  attr_reader :engine,
              :data,
              :invoice_items

  def initialize(data, engine)
    @engine         = engine
    @data           = data
    @invoice_items  = create_invoice_items
  end

  def create_invoice_items
    data.map do |attributes|
      InvoiceItem.new(attributes, self)
    end
  end

  def create_new_invoice_items(items, invoice_data)
    items_hash = {}

    items.each do |item|
      if items_hash[item.id].nil?
        items_hash[item.id] = []
      end
      items_hash[item.id] << item
    end

    items_hash.each do |item_id, items|
      data = {
        id:           invoice_items.last.id + 1,
        invoice_id:   invoice_data[:id],
        item_id:      item_id,
        quantity:     items.length,
        unit_price:   items.first.unit_price,
        created_at:   Time.new,
        updated_at:   Time.new
        }
      invoice_items << InvoiceItem.new(data, self)
    end
  end

  def inspect
    "#<#{self.class} #{invoice_items.size} rows>"
  end

  def find_invoice_by_invoice_id(invoice_id)
    engine.invoice_repository.find_by_id(invoice_id)
  end

  def find_item_by_item_id(item_id)
    engine.item_repository.find_by_id(item_id)
  end

  def all
    invoice_items
  end

  def successful_invoice_items
   @successful_invoice_items ||=
     engine.successful_invoices.flat_map(&:invoice_items)
  end

  def random
    invoice_items.sample
  end

  def find_by_id(id)
    invoice_items.detect { |item| item.id == id }
  end

  def find_all_by_id(id)
    invoice_items.select { |item| item.id == id }
  end

  def find_by_item_id(item_id)
    invoice_items.detect { |item| item.item_id == item_id }
  end

  def find_all_by_item_id(item_id)
    invoice_items.select { |item| item.item_id == item_id }
  end

  def find_by_invoice_id(invoice_id)
    invoice_items.detect { |item| item.invoice_id == invoice_id }
  end

  def find_all_by_invoice_id(invoice_id)
    invoice_items.select { |item| item.invoice_id == invoice_id }
  end

  def find_by_quantity(quantity)
    invoice_items.detect { |item| item.quantity == quantity }
  end

  def find_all_by_quantity(quantity)
    invoice_items.select { |item| item.quantity == quantity }
  end

  def find_by_unit_price(unit_price)
    invoice_items.detect do |item|
      (item.unit_price / 100).to_digits == unit_price.to_digits
    end
  end

  def find_all_by_unit_price(unit_price)
    invoice_items.select do |item|
      (item.unit_price / 100).to_digits == unit_price.to_digits
    end
  end

  def find_by_created_at(created_at)
    invoice_items.detect { |item| item.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    invoice_items.select { |item| item.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    invoice_items.detect { |item| item.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    invoice_items.select { |item| item.updated_at == updated_at }
  end
end
