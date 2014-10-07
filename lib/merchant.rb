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

  def created_at
    @created_at
  end

  def updated_at
    @updated_at
  end

  def invoices
  end

  def items
  end
end
