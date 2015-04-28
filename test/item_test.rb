require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class ItemTest < Minitest::Test
  attr_reader :i

  def setup
    @i = SalesEngine.new('data').item_repository.find_by_id(539)
  end

  def test_that_intializes_correctly
    assert_equal "Item Sunt Saepe", i.name
    assert_equal 26, i.merchant_id
  end

  def test_invoice_items_returns_all_items
    assert_equal 7, i.invoice_items.length
  end

  def test_merchant_returns_a_merchant_instance
    assert_equal "Balistreri, Schaefer and Kshlerin", i.merchant.name
  end

  def test_can_find_successful_invoice_items_by_id
    assert_equal 1, i.find_successful.length
  end
end
