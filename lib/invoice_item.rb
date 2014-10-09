class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price,
              :created_at,   :updated_at, :item,     :invoice

  def initialize(data)
    @id                 = data[:id]
    @item_id            = data[:item_id]
    @invoice_id         = data[:invoice_id]
    @quantity           = data[:quantity]
    @unit_price         = BigDecimal.new("#{data[:unit_price]}".rjust(3, "0").insert(-3, "."))
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def give_item(item)
    @item = item
  end

  def give_invoice(invoice)
    @invoice = invoice
  end
end
