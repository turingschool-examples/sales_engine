gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant'
require_relative '../lib/items'

class MerchantTest < Minitest::Test

  def setup
    @item = Item.new(updated_at: '2012-03-28 14:53:59 UTC', unit_price: '777777')
    @item2 = Item.new(updated_at: '2012-03-27 14:53:59 UTC', unit_price: '888888')
    @merchant = Merchant.new(items: [@item, @item2])
  end

  def test_revenue_with_date
    assert_equal BigDecimal.new('8888.88'), @merchant.revenue(Date.parse('2012-03-27'))
  end

  def test_revenue_without_date
    assert_equal BigDecimal.new('16666.65'), @merchant.revenue
  end

end
