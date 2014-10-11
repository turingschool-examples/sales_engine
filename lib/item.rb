require 'bigdecimal'
require 'date'

class Item
  attr_reader :id, :description, :name, :unit_price, :merchant_id, :created_at,
              :updated_at, :invoice_items, :merchant

  def initialize(data)
    @id                 = data[:id]
    @description        = data[:description]
    @name               = data[:name]
    @unit_price         = BigDecimal.new("#{data[:unit_price]}") / 100
    @merchant_id        = data[:merchant_id]
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def give_invoice_items(invoice_items)
    @invoice_items = invoice_items
  end

  def give_merchant(merchant)
    @merchant = merchant
  end

  def revenue
    invoice_items.collect(&:revenue).reduce(0, :+)
  end

  def times_sold
    successful_invoice_items.collect(&:quantity).reduce(0, :+)
  end

  def best_day
    successful_invoice_items.group_by { |invoice_item| Date.parse(invoice_item.invoice.created_at) }
    .max_by { |date, invoice_items| invoice_items.collect(&:quantity).reduce(0, :+) }[0]
  end

  def successful_invoice_items
    invoice_items.select(&:successful?)
  end
end
