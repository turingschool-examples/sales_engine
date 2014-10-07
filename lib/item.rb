class Item
  attr_reader :id, :description, :name, :unit_price, :merchant_id, :created_at,
              :updated_at, :invoice_items, :merchant

  def initialize(data)
    @id                 = data[:id]
    @description        = data[:description]
    @name               = data[:name]
    @unit_price         = data[:unit_price]
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
end
