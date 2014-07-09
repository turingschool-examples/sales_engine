require 'bigdecimal'
require 'pry'
class InvoiceItem

  attr_reader   :id,
                :item_id,
                :invoice_id,
                :quantity,
                :unit_price,
                :created_at,
                :updated_at

  attr_accessor :item
                :item_revenue

  def initialize(data)
    @id           = data[:id]
    @item_id      = data[:item_id]
    @invoice_id   = data[:invoice_id]
    @quantity     = data[:quantity]
    @unit_price   = price(data[:unit_price])
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
    @item_revenue = 0
  end


  def price(number)
    price = number.to_f / 100
    BigDecimal.new(price.to_s)
  end

  def revenue
    amount = BigDecimal.new(@quantity) * @unit_price
  end

  def item_revenue
    @item_revenue = @quantity.to_i x @unit_price.to_i
  end

end
