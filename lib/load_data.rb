require 'csv'

module LoadData
  def open_data(path, filename)
    CSV.open "./#{path}/#{filename}.csv", headers: true, header_converters: :symbol
  end

  def merchant_data(path = "fixtures")
    open_data(path, "merchants")
  end

  def item_data(path = "fixtures")
    open_data(path, "items")
  end

  def invoice_data(path = "fixtures")
    open_data(path, "invoices")
  end

  def transaction_data(path = "fixtures")
    open_data(path, "transactions")
  end

  def invoice_item_data(path = "fixtures")
    open_data(path, "invoice_items")
  end

  def customer_data(path = "fixtures")
    open_data(path, "customers")
  end
end
