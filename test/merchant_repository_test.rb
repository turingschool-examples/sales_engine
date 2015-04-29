require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'
require './lib/load_data'
require './lib/sales_engine'
require 'bigdecimal/util'
require_relative './test_helper'


class MerchantRepositoryTest < Minitest::Test
  include LoadData

  attr_reader :m

  def setup
    @m = MerchantRepository.new(load_csv("fixtures", "merchants.csv"), SalesEngine.new)
  end

  def test_can_find_all_merchants
    assert_equal 12, m.all.length
  end

  def test_that_random_returns_random_merchant_object
    assert_equal true, m.random.is_a?(Merchant)
  end

  def test_can_find_by_id
    assert_equal "Schroeder-Jerde", m.find_by_id(1).name
  end

  def test_find_all_by_id
    assert_equal 1, m.find_all_by_id(1).length
  end

  def test_find_by_name
    assert_equal "Schroeder-Jerde", m.find_by_name("Schroeder-Jerde").name
  end

  def test_find_all_by_name
    assert_equal 1, m.find_all_by_name("Schroeder-Jerde").length
  end

  def test_find_by_created_at
    assert_equal 1, m.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_created_at
    assert_equal 9, m.find_all_by_created_at("2012-03-27 14:53:59 UTC").length
  end

  def test_find_by_updated_at
    assert_equal 1, m.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_updated_at
    assert_equal 8, m.find_all_by_updated_at("2012-03-27 14:53:59 UTC").length
  end

  def test_inspects_rows
    assert_equal "#<MerchantRepository 12 rows>", m.inspect
  end

  def test_most_revenue_returns_top_number
    assert_equal "Balistreri, Schaefer and Kshlerin", m.most_revenue(3).first.name
  end

  def test_most_items_returns_top_number_given
    assert_equal "Balistreri, Schaefer and Kshlerin", m.most_items(3).first.name
  end

  def test_revenue_by_date
    assert_equal "21067.77", m.revenue(Date.parse("2012-03-25 09:54:09 UTC")).to_digits
  end
end
