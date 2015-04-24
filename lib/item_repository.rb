require 'csv'
require_relative 'item'
require_relative 'sales_engine'

class ItemRepository
  attr_accessor :items
  attr_reader :engine, :data

  def initialize(data, engine)
    @engine = engine
    @data = data
    @items ||= create_items
  end

  def load_data
    @items ||= create_items
  end

  # def contents
  #   CSV.open "./data/items.csv", headers: true, header_converters: :symbol
  # end

  def create_items
    # puts "READING ITEMS"
    data.map do |attributes|
      Item.new(attributes, self)
    end
  end

  def all
    items
  end

  def find_invoice_items_by_item_id(item_id)
    engine.invoice_item_repo.find_all_by_item_id(item_id)
  end

  def find_merchant_by_id(merchant_id)
    engine.merchant_repo.find_by_id(merchant_id)
  end

  def random
    items.sample
  end

  def find_by_id(id)
    items.find { |item| item.id == id }
  end

  def find_all_by_id(id)
    items.select { |item| item.id == id }
  end

  def find_by_name(name)
    items.find { |item| item.name == name }
  end

  def find_all_by_name(name)
    items.select { |item| item.name == name }
  end

  def find_by_description(description)
    items.find { |item| item.description == description }
  end

  def find_all_by_description(description)
    items.select { |item| item.description == description }
  end

  def find_by_unit_price(unit_price)
    items.find { |item| item.unit_price == unit_price }
  end

  def find_all_by_unit_price(unit_price)
    items.select { |item| item.unit_price == unit_price }
  end

  def find_by_merchant_id(merchant_id)
    items.find { |item| item.merchant_id == merchant_id }
  end

  def find_all_by_merchant_id(merchant_id)
    items.select { |item| item.merchant_id == merchant_id }
  end

  def find_by_created_at(created_at)
    items.find { |item| item.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    items.select { |item| item.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    items.find { |item| item.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    items.select { |item| item.updated_at == updated_at }
  end
end
