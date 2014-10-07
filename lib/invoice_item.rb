class InvoiceItem
attr_reader :id

  def initialize
    @id            = ""
    @item_id       = ""
    @invoice_id    = ""
    @quantity      = ""
    @unit_price    = ""
    @created_at    = ""
    @updated_at    = ""
  end

  def find_by_id
  end

  def item
  end

end
