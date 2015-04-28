require 'bigdecimal'

class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repo

  def initialize(attributes, repo)
    @repo         = repo
    @id           = attributes[:id].to_i
    @name         = attributes[:name]
    @description  = attributes[:description]
    @unit_price   = BigDecimal.new(attributes[:unit_price].to_s)
    @merchant_id  = attributes[:merchant_id].to_i
    @created_at   = attributes[:created_at]
    @updated_at   = attributes[:updated_at]
  end

  def invoice_items
    repo.find_invoice_items_by_item_id(id)
  end

  def merchant
    repo.find_merchant_by_id(merchant_id)
  end

  def best_day
    repo.find_best_day_for_item(id)
  end

  def revenue
    repo.find_total_revenue(id)
  end

  def total_sold
    repo.find_total_sold(id)
  end
end
