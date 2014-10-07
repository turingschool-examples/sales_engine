class InvoiceItem

  def initialize(data)
    @id                 = data[:id]
    @description        = data[:description]
    @name               = data[:name]
  end

  def id
    @id
  end

  def description
    @description
  end

  def name
    @invoice_id
  end

  def invoice_items
  end

  def merchant
  end
end
