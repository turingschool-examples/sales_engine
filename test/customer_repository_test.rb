require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer_repository'
require './lib/load_data'
require './lib/sales_engine'

class CustomerRepositoryTest < Minitest::Test
  include LoadData

  attr_reader :c

  def setup
    @c = CustomerRepository.new(customer_data("fixtures"), SalesEngine.new)
  end

  def test_all_returns_all_customers
    assert_equal 18, c.all.length
  end

  def test_can_find_favorite_merchant_by_customer_id
    assert_equal 26, c.find_favorite_merchant_by_customer_id(1).id
  end

  def test_random_method
    assert_equal true, c.random.is_a?(Customer)
  end

  def test_can_find_by_id
    assert_equal "Joey", c.find_by_id(1).first_name
  end

  def test_can_find_all_by_id
    assert_equal 1, c.find_all_by_id(1).length
  end

  def test_can_find_by_first_name
    assert_equal "Rutherford", c.find_by_first_name("Ova").last_name
  end

  def test_can_find_all_by_first_name
    assert_equal 2, c.find_all_by_first_name("Ashly").length
  end

  def test_can_find_by_last_name
    assert_equal "Laurie", c.find_by_last_name("Kuvalis").first_name
  end

  def test_can_find_all_by_last_name
    assert_equal 5, c.find_all_by_last_name("Schamberger").length
  end

  def test_find_by_created_at
    assert_equal 2, c.find_by_created_at("2012-03-27 14:54:10 UTC").id
  end

  def test_find_all_by_created_at
    assert_equal 6, c.find_all_by_created_at("2012-03-27 14:54:10 UTC").length
  end

  def test_find_by_updated_at
    assert_equal 2, c.find_by_updated_at("2012-03-27 14:54:10 UTC").id
  end

  def test_find_all_by_updated_at
    assert_equal 6, c.find_all_by_updated_at("2012-03-27 14:54:10 UTC").length
  end
end
