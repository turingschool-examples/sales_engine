require 'bigdecimal'
require 'pry'
class InvoiceItem

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  attr_accessor :item

  def initialize(data)
    @id         = data[:id]
    @item_id    = data[:item_id]
    @invoice_id = data[:invoice_id]
    @quantity   = data[:quantity]
    @unit_price = price(data[:unit_price])
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end


  def price(number)
    price = number.to_f / BigDecimal.new('100')
    BigDecimal.new(price.to_s)
  end

  def revenue
    amount = BigDecimal.new(@quantity) * @unit_price
  end

end
