require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :m
  def setup
    @m = MerchantRepository.new
  end

  def test_that_random_returns_random_merchant_object
    assert_equal true, m.random.is_a?(Merchant)
  end

  def test_can_find_by_id
    assert_equal "Schroeder-Jerde", m.find_by_id("1").name
  end

  def test_find_all_by_id
    assert_equal 1, m.find_all_by_id("1").length
  end

  def test_find_by_name
    assert_equal "Schroeder-Jerde", m.find_by_name("Schroeder-Jerde").name
  end

  def test_find_all_by_name
    assert_equal 1, m.find_all_by_name("Schroeder-Jerde").length
  end

  def test_find_by_created_at
    assert_equal "1", m.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_created_at
    assert_equal 9, m.find_all_by_created_at("2012-03-27 14:53:59 UTC").length
  end

  def test_find_by_updated_at
    assert_equal "1", m.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_updated_at
    assert_equal 8, m.find_all_by_updated_at("2012-03-27 14:53:59 UTC").length
  end

end
