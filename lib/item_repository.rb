require 'csv'
require_relative 'item'
require_relative 'sales_engine'

class ItemRepository
  attr_accessor :items
  attr_reader :engine, :data

  def initialize(data, engine)
    @engine = engine
    @data = data
    @items = create_items
  end

  def create_items
    data.map do |attributes|
      Item.new(attributes, self)
    end
  end

  def inspect
    "#<#{self.class} #{items.size} rows>"
  end

  def all
    items
  end

  def find_invoice_items_by_item_id(item_id)
    engine.invoice_item_repository.find_all_by_item_id(item_id)
  end

  def find_merchant_by_id(merchant_id)
    engine.merchant_repository.find_by_id(merchant_id)
  end

  def random
    items.sample
  end

  def find_by_id(id)
    items.detect { |item| item.id == id }
  end

  def find_all_by_id(id)
    items.select { |item| item.id == id }
  end

  def find_by_name(name)
    items.detect { |item| item.name == name }
  end

  def find_all_by_name(name)
    items.select { |item| item.name == name }
  end

  def find_by_description(description)
    items.detect { |item| item.description == description }
  end

  def find_all_by_description(description)
    items.select { |item| item.description == description }
  end

  def find_by_unit_price(unit_price)
    items.detect { |item| item.unit_price == unit_price }
  end

  def find_all_by_unit_price(unit_price)
    items.select { |item| item.unit_price == unit_price }
  end

  def find_by_merchant_id(merchant_id)
    items.detect { |item| item.merchant_id == merchant_id }
  end

  def find_all_by_merchant_id(merchant_id)
    items.select { |item| item.merchant_id == merchant_id }
  end

  def find_by_created_at(created_at)
    items.detect { |item| item.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    items.select { |item| item.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    items.detect { |item| item.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    items.select { |item| item.updated_at == updated_at }
  end
end
