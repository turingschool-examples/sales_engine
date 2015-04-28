require_relative 'item'
require 'csv'
require 'bigdecimal/util'

class ItemRepository
  attr_reader :items,
              :engine,
              :data

  def initialize(data, engine)
    @engine = engine
    @data   = data
    @items  = create_items
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

  def most_revenue(x)
    engine.most_revenue_sorted_by_item(x)
  end

  def find_best_day_for_item(item_id)
    engine.best_day_for_item(item_id)
  end

  def most_items(x)
    items.max_by(x) {|item| item.total_sold}
  end

  def find_successful_invoice_items_by_item_id(item_id)
    engine.all_successful_invoice_items_by_item_id(item_id)
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
    items.detect do |item|
      (item.unit_price / 100).to_digits == unit_price.to_digits
    end
  end

  def find_all_by_unit_price(unit_price)
    items.select do |item|
      (item.unit_price / 100).to_digits == unit_price.to_digits
    end
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
