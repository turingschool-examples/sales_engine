require 'csv'
require_relative 'item'

class ItemRepository
  attr_accessor :items

  def initialize
    @items = make_items
  end

  def contents
    CSV.open "./fixtures/items.csv", headers: true, header_converters: :symbol
  end

  def make_items
    contents.map do |row|
      item              = Item.new
      item.id           = row[:id]
      item.name         = row[:name]
      item.description  = row[:description]
      item.unit_price   = row[:unit_price]
      item.merchant_id  = row[:merchant_id]
      item.created_at   = row[:created_at]
      item.updated_at   = row[:updated_at]
      item
    end
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
