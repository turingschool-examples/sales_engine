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

  def give_invoices(invoices)
    @invoices = invoices
  end

  def revenue
    invoices.reduce(0) do |sum, invoice|
      index = -1
      sum + invoice.invoice_items.reduce(0) do |sum_two, invoice_item|
        index += 1
        unless invoice.transactions[index].result == "failed"
          sum_two + (BigDecimal.new(invoice_item.unit_price) * BigDecimal.new(invoice_item.quantity))
        else
          sum_two
        end
      end
    end
  end

end
