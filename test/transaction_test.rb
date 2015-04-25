require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction'
require './lib/sales_engine'

class TransactionTest < Minitest::Test
  attr_reader :t

  def setup
    @t = SalesEngine.new.transaction_repository.find_by_invoice_id("2")
  end

  def test_that_invoice_returns_instance_of_invoice
    assert_equal "75", t.invoice.merchant_id
  end
end
