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

  def test_transactions_returns_all_transactions_with_invoice_id
    assert_equal 3, i.transactions.length
  end

  def test_invoice_items_returns_all_invoice_items_with_invoice_id
    assert_equal 6, i.invoice_items.length
  end

  def test_items_method_returns_all_items_with_invoice_id
    assert_equal 6, i.items.length
  end
end
