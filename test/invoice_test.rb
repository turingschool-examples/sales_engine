require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice'

class InvoiceTest < Minitest::Test
  attr_reader :i

  def setup
    @i = Invoice.new
    i.id = "34"
  end

  def test_invoice_object_exists_after_initialization
    assert i
  end

  def test_that_transactions_returns_all_transactions_with_invoice_id
    assert_equal 3, i.transactions.length
  end
end
