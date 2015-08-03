class InvoiceItem
  attr_accessor :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize
    @id
    @item_id
    @invoice_id
    @quantity
    @unit_price
    @created_at
    @updated_at
  end
end
