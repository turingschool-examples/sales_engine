require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item'

class InvoiceItemTest < Minitest::Test
  attr_reader :i

  def setup
    @i = InvoiceItem.new
    i.invoice_id = "1"
    i.item_id = "529"
  end

  def test_that_invoice_returns_an_invoice_instance
    assert_equal "26", i.invoice.merchant_id
  end

  def test_that_item_returns_item_instance
    assert_equal "Item Eius Et", i.item.name
  end
end
