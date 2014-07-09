gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer'
require_relative '../lib/transaction'
require_relative '../lib/invoice'
require_relative '../lib/merchant'
require 'pry'

class CustomerTest < Minitest::Test

  def setup
    @merchant1    = Merchant.new(id: 1)
    @merchant2    = Merchant.new(id: 2)
    @transaction1 = Transaction.new(invoice_id: 1, result: 'success')
    @transaction2 = Transaction.new(invoice_id: 1, result: 'failed')
    @transaction3 = Transaction.new(invoice_id: 2, result: 'success')
    @transaction4 = Transaction.new(invoice_id: 3, result: 'success')
    @invoice      = Invoice.new(id: 1, merchant: [@merchant1], transactions: [@transaction1, @transaction2])
    @invoice2     = Invoice.new(id: 2, merchant: [@merchant2], transactions: [@transaction3])
    @invoice3     = Invoice.new(id: 3, merchant: [@merchant1], transactions: [@transaction4])
    @transaction1.invoice = @invoice
    @transaction2.invoice = @invoice
    @transaction3.invoice = @invoice2
    @transaction4.invoice = @invoice3
    @customer     = Customer.new(id: 1, invoices: [@invoice, @invoice2, @invoice3], transactions: [@transaction1, @transaction2, @transaction3, @transaction4])
  end

  def test_customer_has_transactions
    assert @customer.transactions == [@transaction1, @transaction2, @transaction3, @transaction4]
  end

  def test_customer_favorite_merchant
    binding.pry
    assert @customer.favorite_merchant ==  @merchant1
  end
end
