require_relative 'item'
require 'bigdecimal/util'

class ItemRepository
  attr_reader :items,
              :engine,
              :data,
              :i_by_id,
              :i_by_merchant_id

  def initialize(data, engine)
    @engine           = engine
    @data             = data
    @items            = create_items
    @i_by_id          = group_by_id
    @i_by_merchant_id = group_by_merchant_id
  end

  def create_items
    data.map do |attributes|
      Item.new(attributes, self)
    end
  end

  def group_by_id
    items.group_by(&:id)
  end

  def group_by_merchant_id
    items.group_by(&:merchant_id)
  end

  def inspect
    "#<#{self.class} #{items.size} rows>"
  end

  def all
    items
  end

  def most_revenue(number)
    items.max_by(number) { |item| item.revenue }
  end

  def find_invoice_date_by_invoice_id(invoice_id)
    engine.find_invoice_date_by_invoice_id(invoice_id)
  end

  def most_items(x)
    items.max_by(x) { |item| item.total_sold }
  end

  def successful_invoice_items
    engine.successful_invoice_items
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
    i_by_id[id].first
  end

  def find_all_by_id(id)
    i_by_id[id]
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
    i_by_merchant_id[merchant_id].first
  end

  def find_all_by_merchant_id(merchant_id)
    i_by_merchant_id[merchant_id]
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
