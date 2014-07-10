require_relative 'repository'
require 'pry'

class Invoice < Repository

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :objects

  attr_accessor :transactions,
                :invoice_items,
                :items,
                :customer,
                :merchant

  def initialize(data)
    @id            = data[:id].to_i
    @customer_id   = data[:customer_id].to_i
    @merchant_id   = data[:merchant_id].to_i
    @status        = data[:status]
    @created_at    = date_parse(data[:created_at])
    @updated_at    = date_parse(data[:updated_at])
    @invoice_items = data[:invoice_items]
    @transactions  = data[:transactions]
    @merchant      = data[:merchant]
    @customer      = data[:customer]
    @items         = data[:items]
  end

  def revenue(date = nil)
    amount = 0
    if status?
      binding.pry
      @invoice_items.each do |invoice_item|
        amount += invoice_item.revenue
      end
    end
    amount
  end

  def status?
    transactions.any? {|transaction| transaction.result == 'success'}
  end

  def none?
    transactions.all? {|transaction| transaction.result == 'failed' or nil}
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end


  def charge(data)
    transactions << Transaction.new(data)
  end

  private

  def date_parse(date)
    Date.parse(date) if date != nil
  end

end
