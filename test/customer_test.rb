gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer'
require_relative '../lib/transaction'
require_relative '../lib/invoice'

class CustomerTest < Minitest::Test
  def test_customer_has_transactions
    @transaction1 = Transaction.new(invoice_id: 1)
    @transaction2 = Transaction.new(invoice_id: 1)
    @invoice      = Invoice.new(id: 1)
    @customer     = Customer.new(id: 1, invoice: [@invoice])
    assert @customer.transactions = [@transaction1, @transaction2]
  end
end
