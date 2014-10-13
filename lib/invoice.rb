require_relative 'transaction'

class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at,
              :updated_at, :transactions, :invoice_items, :items,
              :customer, :merchant

  def initialize(data)
    @id          = data[:id]
    @customer_id = data[:customer_id]
    @merchant_id = data[:merchant_id]
    @status      = data[:status]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end

  def assign_transactions(transactions)
    @transactions  = transactions
  end

  def assign_invoice_items(invoice_items)
    @invoice_items = invoice_items
  end

  def assign_items(items)
    @items    = items
  end

  def assign_customer(customer)
    @customer = customer
  end

  def assign_merchant(merchant)
    @merchant = merchant
  end

  def charge(data)
    transactions << Transaction.new(data)
  end

  def pending?
    transactions.none?(&:success?)
  end

  def successful?
    !pending?
  end

  def total_revenue
    invoice_items.collect(&:revenue).reduce(:+)
  end

  def inspect
    "<#{self.class} ID: #{id}>"
  end
end
