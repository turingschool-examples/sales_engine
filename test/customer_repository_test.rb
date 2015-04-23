require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :c

  def setup
    @c = CustomerRepository.new
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

  def test_that_random_returns_random_customer_object
    assert_equal true, c.random.is_a?(Customer)
  end
end
