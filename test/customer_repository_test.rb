require_relative 'test_helper'
require_relative '../lib/customer_repository'
require_relative '../lib/customer'

class CustomerRepositoryTest < Minitest::Test
  def setup
    customer_one = Customer.new {id: "12" first_name: "john" last_name: "smith" created_at: "a" updated_at: "e" }
    customer_two = Customer.new {id: "231" first_name: "bob" last_name: "brown" created_at: "b" updated_at: "d" }
    customer_three = Customer.new {id: "1" first_name: "joe" last_name: "brown" created_at: "c" updated_at: "d" }
    @customers = [customer_one, customer_two, customer_three]
    @repository = CustomerRepository.new(@customers)
  end

  def test_returns_all
    assert_equal @customers, @repository.all
  end

  def test_returns_random
    assert_instance_of Customer, @repository.random
  end

  def test_finds_by_id
  	assert_equal @items[0], @repository.find_by_id("12")
  end

  def test_finds_by_first_name
  	assert_equal @items[1], @repository.find_by_first_name("bob")
  end

  def test_finds_by_last_name
  	assert_equal @items[0], @repository.find_by_last_name("smith")
  end

  def test_finds_by_created_at
  	assert_equal @items[2], @repository.find_by_created_at("c")
  end

  def test_finds_by_updated_at
  	assert_equal @items[0], @repository.find_by_updated_at("e")
  end

  def test_finds_all_by_id
  	assert_equal 1, @repository.find_all_by_id("1").size
  end

  def test_finds_all_by_first_name
  	assert_equal 1, @repository.find_all_by_first_name("bob").size
  end

  def test_finds_all_by_last_name
  	assert_equal 2, @repository.find_all_by_last_name("brown").size
  end

  def test_finds_all_by_created_at
  	assert_equal 1, @repository.find_all_by_created_at("c").size
  end

  def test_finds_all_by_updated_at
  	assert_equal 2, @repository.find_all_by_updated_at("d").size
  end
end
