require 'bigdecimal'
require 'bigdecimal/util'
require 'time'

class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repo

  def initialize(data, repo)
    @id =          data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status =      data[:status]
    @created_at =  Time.parse(data[:created_at])
    @updated_at =  Time.parse(data[:updated_at])
    @repo = repo
  end

  def transactions
  end

  def invoice_items
  end

  def items
  end

  def customer
  end

  def merchant
  end
end
