require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class InvoiceItemTest < Minitest::Test
  attr_reader :i

  def setup
    @i = SalesEngine.new.invoice_item_repository.find_by_id(1)
  end

  def test_invoice_item_intializes_correctly
    assert_equal 539, i.item_id
    assert_equal 1, i.invoice_id
    assert_equal 5, i.quantity
  end

  def test_that_invoice_returns_an_invoice_instance
    assert_equal 26, i.invoice.merchant_id
  end

  def test_that_item_returns_item_instance
    assert_equal "Item Sunt Saepe", i.item.name
  end
end
