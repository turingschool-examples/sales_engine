require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'

class MerchantTest < Minitest::Test
  attr_reader :m

  def setup
    @m = Merchant.new
    m.id = "1"
  end

  def test_that_items_method_returns_items_that_merchant_sells
    assert_equal 11, m.items.length
  end

  def test_that_invoices_method_returns_invoices_for_that_merchant
    assert_equal 3, m.invoices.length
  end
end
