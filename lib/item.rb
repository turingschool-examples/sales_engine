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
    best_day = invoice_items.max_by do |invoice_item|
      invoice_item.quantity
    end
    Date.parse(repo.find_invoice_date_by_invoice_id(best_day.invoice_id))
  end

  def successful_invoice_items
    repo.successful_invoice_items.select do |invoice_item|
      invoice_item.item_id == id
    end
  end

  def total_sold
    successful_invoice_items.reduce(0) do |sum, invoice_item|
      sum + invoice_item.quantity
    end
  end

  def revenue
    successful_invoice_items.reduce(0) do |sum, inv_item|
      sum + (inv_item.unit_price / 100) * inv_item.quantity
    end
  end
end
