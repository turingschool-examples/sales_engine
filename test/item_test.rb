require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class ItemTest < Minitest::Test
  attr_reader :i

  def setup
    @x = SalesEngine.new
    @i = @x.item_repository.find_by_id(539)
  end

  def test_invoice_items_returns_all_items
    assert_equal 7, i.invoice_items.length
  end

  def test_merchant_returns_a_merchant_instance
    assert_equal "Balistreri, Schaefer and Kshlerin", i.merchant.name
  end
end
