class InvoiceItem

  def initialize(data)
    @id                 = data[:id]
    @item_id            = data[:item_id]
    @invoice_id         = data[:invoice_id]
    @quantity           = data[:quantity]
    @unit_price         = data[:unit_price]
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def id
    @id
  end

  def item_id
    @item_id
  end

  def invoice_id
    @invoice_id
  end

  def quantity
    @quantity
  end

  def unit_price
    @unit_price
  end

  def created_at
    @created_at
  end

  def updated_at
    @updated_at
  end

  def item
  end

  def invoice
  end
end
