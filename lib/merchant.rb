require 'bigdecimal'

class Merchant

  attr_reader :id, :name, :created_at, :updated_at, :items, :invoices

  def initialize(data)
    @id                 = data[:id]
    @name               = data[:name]
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def give_items(items)
    @items = items
  end

  def items_sold
    invoices.select(&:successful?).collect(&:invoice_items).flatten.collect(&:quantity).reduce(0, :+)
  end

  def give_invoices(invoices)
    @invoices = invoices
  end

  def customers_with_pending_invoices
    invoices.select(&:pending?).collect(&:customer).uniq
  end

  def favorite_customer
    invoices.group_by(&:customer).max_by do |pair|
      pair[1].count(&:successful?)
    end.first
  end

  def revenue(date = nil) #TODO: BROKEN
    invoices_on_date(date).select(&:successful?).collect(&:total_revenue).reduce(0, :+)
  end

  def invoices_on_date(date)
    return invoices unless date
    invoices.select do |invoice|
      date == Date.parse(invoice.created_at)
    end
  end

end
