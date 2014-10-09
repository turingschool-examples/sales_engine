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

  def customers_with_pending_invoices
    invoices.select do |invoice|
      invoice.transactions.none? do |transaction|
        transaction.result == "success"
      end
    end.collect(&:customer).uniq
  end

  def favorite_customer
    invoices.group_by do |invoice|
      invoice.customer
    end.to_a.max_by do |pair|
      pair[1].reduce(0) do |sum, invoice|
        sum + invoice.transactions.count do |transaction|
          transaction.result == "success"
        end
      end
    end[0]
  end

  def revenue(date = nil)
    invoices.reduce(0) do |sum, invoice|
      index = -1
      sum + invoice.invoice_items.reduce(0) do |sum_two, invoice_item|
        index += 1
        transaction = invoice.transactions[index]
        unless transaction.result == "failed" || (date && Date.parse(date) != Date.parse(transaction.created_at))
          sum_two + (BigDecimal.new(invoice_item.unit_price) * BigDecimal.new(invoice_item.quantity))
        else
          sum_two
        end
      end
    end
  end

end
