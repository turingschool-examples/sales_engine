require 'bigdecimal'
# require 'pry'
class InvoiceItem

  attr_reader   :id,
                :item_id,
                :invoice_id,
                :quantity,
                :unit_price,
                :created_at,
                :updated_at

  attr_accessor :item,
                :invoice

  def initialize(data)
    @id         = data[:id].to_i
    @item_id    = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity   = data[:quantity].to_i
    @unit_price = price(data[:unit_price])
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end


  def revenue
    @unit_price * quantity
  end

  private

  def price(number)
    BigDecimal.new(number.to_s) / 100
  end
end
