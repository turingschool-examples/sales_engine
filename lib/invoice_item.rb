require_relative 'sales_engine'

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

  def invoice
    engine = SalesEngine.new
    engine.invoice_repo.find_by_id(invoice_id)
  end

  def item
    engine = SalesEngine.new
    engine.item_repo.find_by_id(item_id)
  end
end
