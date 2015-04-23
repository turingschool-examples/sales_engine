require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test
  attr_reader :i

  def setup
    @i = Item.new
    i.id = "539"
    i.merchant_id = "1"
  end

  def test_invoice_items_returns_all_items
    assert_equal 7, i.invoice_items.length
  end

  def test_merchant_returns_a_merchant_instance
    assert_equal "Schroeder-Jerde", i.merchant.name
  end
end
