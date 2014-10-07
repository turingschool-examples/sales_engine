require_relative 'test_helper'
require_relative '../lib/merchant_repository'
require_relative '../lib/merchant'

class MerchantRepositoryTest < Minitest::Test
  def setup
    merchant_one = Merchant.new {id: "1", name: "Adam", created_at: "a", updated_at: "d" }
    merchant_two = Merchant.new {id: "2", name: "Alex", created_at: "a", updated_at: "c" }
    merchant_three = Merchant.new {id: "3", name: "Herbert", created_at: "b", updated_at: "c" }
    @merchants = [merchant_one, merchant_two, merchant_three]
    @repository = MerchantRepository.new(@merchants)
  end

  def test_returns_all
    assert_equal @merchants, @repository.all
  end

  def test_returns_random
    assert_instance_of Merchant, @repository.random
  end

  def test_finds_by_id
    assert_equal @merchants[0], @repository.find_by_id("1")
  end

  def test_finds_by_name
    assert_equal @merchants[0], @repository.find_by_name("Adam")
  end

  def test_finds_by_created_at
    assert_equal @merchants[2], @repository.find_by_created_at("b")
  end

  def test_finds_by_updated_at
    assert_equal @merchants[0], @repository.find_by_updated_at("d")
  end

  def test_finds_all_by_id
    assert_equal 1, @repository.find_all_by_id("1").size
  end

  def test_finds_all_by_name
    assert_equal 1, @repository.find_all_by_name("Herbert").size
  end

  def test_finds_all_by_created_at
    assert_equal 2, @repository.find_all_by_created_at("a").size
  end

  def test_finds_all_by_updated_at
    assert_equal 2, @repository.find_all_by_updated_at("c").size
  end

end
