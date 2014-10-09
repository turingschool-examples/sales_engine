require 'bigdecimal'
require 'date'

class Item
  attr_reader :id, :description, :name, :unit_price, :merchant_id, :created_at,
              :updated_at, :invoice_items, :merchant

  def initialize(data)
    @id                 = data[:id]
    @description        = data[:description]
    @name               = data[:name]
    @unit_price         = BigDecimal.new("#{data[:unit_price]}".rjust(3, "0").insert(-3, "."))
    @merchant_id        = data[:merchant_id]
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def give_invoice_items(invoice_items)
    @invoice_items = invoice_items
  end

  def give_merchant(merchant)
    @merchant      = merchant
  end

  def revenue
    invoice_items.reduce(0) do |sum, item|
      sum + (BigDecimal.new(item.unit_price) * BigDecimal.new(item.quantity))
    end
  end

  def times_sold
    invoice_items.reduce(0) do |sum, item|
      sum + item.quantity.to_i
    end
  end

  def best_day
    best_invoice = invoice_items.max_by { |item| item.quantity.to_i }
    Date.parse(best_invoice.created_at)
  end
end
