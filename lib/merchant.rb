require 'bigdecimal'

class Merchant

  attr_reader :id, :name, :created_at, :updated_at, :items, :invoices

  def initialize(data)
    @id                 = data[:id]
    @name               = data[:name]
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def assign_items(items)
    @items = items
  end

  def items_sold
    successful_invoices.flat_map(&:invoice_items).map(&:quantity).reduce(0, :+)
  end

  def assign_invoices(invoices)
    @invoices = invoices
  end

  def customers_with_pending_invoices
    invoices.select(&:pending?).collect(&:customer).uniq
  end

  def favorite_customer
    customers = successful_invoices.collect(&:customer)
    customers.uniq.max_by { |customer| customers.count(customer) }
  end

  def revenue(date = nil)
    successful_invoices(date).collect(&:total_revenue).reduce(0, :+)
  end

  def successful_invoices(date = nil)
    invoices_on_date(date).select(&:successful?)
  end

  def invoices_on_date(date)
    return invoices unless date
    invoices.select { |invoice| date == Date.parse(invoice.created_at) }
  end

end
