require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :i

  def setup
    @i = InvoiceRepository.new
    @i.make_invoices_array
  end

  def test_that_random_returns_random_invoice_repository_object
    assert_equal true, i.random.is_a?(Invoice)
  end

  def test_can_find_by_id
    assert_equal "26", i.find_by_id("1").merchant_id
  end

  def test_can_find_all_by_id
    assert_equal 1, i.find_all_by_id("2").length
  end

  def test_can_find_by_customer_id
    assert_equal "9", i.find_by_customer_id("2").id
  end

  def test_can_find_all_by_customer_id
    assert_equal 4, i.find_all_by_customer_id("3").length
  end

  def test_can_find_by_merchant_id
    assert_equal true, i.find_by_merchant_id("3").is_a?(Invoice)
  end

  def test_can_find_all_merchant_id
    assert_equal 59, i.find_all_by_merchant_id("1").length
  end

  def test_can_find_by_status
    assert_equal true, i.find_by_status("shipped").is_a?(Invoice)
  end

  def test_can_find_all_by_status
    assert_equal 4843, i.find_all_by_status("shipped").length
  end

  def test_can_find_by_created_at
    assert_equal "1894", i.find_by_created_at("2012-03-07 05:55:40 UTC").id
  end

  def test_can_find_all_by_created_at
    assert_equal 2, i.find_all_by_created_at("2012-03-07 06:54:23 UTC").length
  end

  def test_can_find_by_updated_at
    assert_equal "4437", i.find_by_updated_at("2012-03-27 13:57:55 UTC").id
  end

  def test_can_find_all_by_updated_at
    assert_equal 2, i.find_all_by_updated_at("2012-03-27 06:56:31 UTC").length
  end
end
