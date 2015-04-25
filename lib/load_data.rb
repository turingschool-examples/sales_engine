require 'csv'

module LoadData
  def open_data(path, filename)
    CSV.open "#{path}/#{filename}", headers: true, header_converters: :symbol
  end

  def merchant_data(path = "fixtures")
    open_data(path, "merchants.csv")
  end

  def item_data(path = "fixtures")
    open_data(path, "items.csv")
  end

  def invoice_data(path = "fixtures")
    open_data(path, "invoices.csv")
  end

  def transaction_data(path = "fixtures")
    open_data(path, "transactions.csv")
  end

  def invoice_item_data(path = "fixtures")
    open_data(path, "invoice_items.csv")
  end

  def customer_data(path = "fixtures")
    open_data(path, "customers.csv")
  end
end
