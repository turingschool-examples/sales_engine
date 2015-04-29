require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'
require './lib/sales_engine'
require 'bigdecimal/util'
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

  def test_total_items_sold_for_a_merchant
    merchant = SalesEngine.new.merchant_repository.find_by_id(26)
    assert_equal 47, merchant.total_items_sold
  end

  def test_revenue_returns_revenue_for_a_date
    merchant = SalesEngine.new.merchant_repository.find_by_id(26)
    assert_equal "21067.77", merchant.revenue(Date.parse("2012-03-25 09:54:09 UTC")).to_digits
  end

  def test_can_return_customers_with_pending_invoices
    merchant = SalesEngine.new.merchant_repository.find_by_id(34)
    assert_equal "Mariah", merchant.customers_with_pending_invoices.first.first_name
  end

  def test_can_calculate_total_revenue_by_merchant_id_no_date
    merchant = SalesEngine.new.merchant_repository.find_by_id(26)
    assert_equal BigDecimal.new("21067.77"), merchant.revenue
  end

  def test_can_find_fave_customer_by_merchant_id
    merchant = SalesEngine.new.merchant_repository.find_by_id(26)
    assert_equal 1, merchant.favorite_customer.id
  end

  def test_can_find_successful_invoices_by_merchant_id
    merchant = SalesEngine.new.merchant_repository.find_by_id(26)
    assert_equal 1, merchant.successful_invoices.length
  end

  # def test_calculate_revenue_of_invoice_items
  #   invoices = []
  #   invoices << engine.invoice_repository.find_by_id(1)
  #   invoices << engine.invoice_repository.find_by_id(2)
  #   invoice_items = engine.find_all_invoice_items_with_multiple_invoices(invoices)
  #   assert_equal "26356.9", engine.calculate_revenue_of_invoice_items(invoice_items).to_digits
  # end
end
