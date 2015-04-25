require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item'
require './lib/sales_engine'

class InvoiceItemTest < Minitest::Test
  attr_reader :i

  def setup
    @i = SalesEngine.new.invoice_item_repository.find_by_id("1")
  end

  def test_that_invoice_returns_an_invoice_instance
    assert_equal "26", i.invoice.merchant_id
  end

  def test_that_item_returns_item_instance
    assert_equal "Item Sunt Saepe", i.item.name
  end
end
