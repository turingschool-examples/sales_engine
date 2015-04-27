require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class TransactionTest < Minitest::Test
  attr_reader :t

  def setup
    @t = SalesEngine.new.transaction_repository.find_by_invoice_id(2)
  end

  def test_that_invoice_returns_merchant_id
    assert_equal 75, t.invoice.merchant_id
  end

  def test_that_invoice_returns_customer_id
    assert_equal 1, t.invoice.customer_id
  end
end
