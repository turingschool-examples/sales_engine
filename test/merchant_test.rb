require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'
require './lib/sales_engine'
require_relative './test_helper'


class MerchantTest < Minitest::Test
  attr_reader :m

  def setup
    @m = SalesEngine.new.merchant_repository.find_by_id(1)
  end

  def test_that_items_returns_items_that_merchant_sells
    assert_equal 11, m.items.length
  end

  def test_that_invoices_returns_invoices_for_that_merchant
    assert_equal 3, m.invoices.length
  end

  def test_that_revenue_returns_revenue_for_merchant
    merchant = SalesEngine.new.merchant_repository.find_by_id(26)
    assert_equal BigDecimal.new("21067.77"), merchant.revenue
  end

  def test_that_revenue_returns_revenue_for_merchant_and_date
    merchant = SalesEngine.new.merchant_repository.find_by_id(26)
    assert_equal BigDecimal.new("21067.77"), merchant.revenue(Date.parse("2012-03-25 09:54:09 UTC"))
  end

  def test_favorite_customer_returns_customer_id
    merchant = SalesEngine.new.merchant_repository.find_by_id(26)
    assert_equal 1, merchant.favorite_customer.id
  end

  def test_customers_with_pending_invoices
    merchant = SalesEngine.new.merchant_repository.find_by_id(34)
    assert_equal "Mariah", merchant.customers_with_pending_invoices.first.first_name
  end
end
