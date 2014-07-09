# require 'pry'
class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at


  attr_accessor :invoices,
                :items

  def initialize(data)
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @invoices   = data[:invoices]
  end

  def revenue(date = nil)
    amount     = BigDecimal.new("0")
    @invoices.each do |invoice|
      if date == nil || date == invoice.updated_at
        amount += invoice.revenue
      end
    end
    amount
  end

<<<<<<< HEAD
  def total_items_sold
    shipped_invoice_items.reduce(0) do |sum, invoice_item|
    sum += invoice_item.quantity.to_i
    end
  end
=======



>>>>>>> bbd86dd968d87e1d4a55ca950084c7037a349602

  private

  def shipped_invoice_items
    shipped_invoices = invoices.select { |invoice| invoice.status == 'shipped' }
    shipped_invoices.map(&:invoice_items).flatten
  end

end
