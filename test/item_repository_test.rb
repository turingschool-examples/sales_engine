require_relative 'test_helper'
require_relative '../lib/item_repository'
require_relative '../lib/item'

class ItemRepositoryTest < Minitest::Test
  def setup
    item_one = Item.new({id: "1", name: "fork", description: "aa", unit_price: "3", merchant_id: "5", created_at: "89", updated_at: "99" })
    item_two = Item.new({id: "2", name: "tree", description: "aa", unit_price: "8", merchant_id: "5", created_at: "92", updated_at: "103" })
    item_three = Item.new({id: "3", name: "dog", description: "c", unit_price: "2", merchant_id: "0", created_at: "64", updated_at: "103" })
    @items = [item_one, item_two, item_three]
    @repository = ItemRepository.new(@items)
  end

  def test_returns_all
    assert_equal @items, @repository.all
  end

  def test_returns_random
    assert_instance_of Item, @repository.random
  end

  def test_finds_by_id
  	assert_equal @items[0], @repository.find_by_id("1")
  end

  def test_finds_by_name
  	assert_equal @items[2], @repository.find_by_name("dog")
  end

  def test_finds_by_description
  	assert_equal @items[2], @repository.find_by_description("c")
  end

  def test_finds_by_unit_price
  	assert_equal @items[1], @repository.find_by_unit_price("8")
  end

  def test_finds_by_merchant_id
  	assert_equal @items[2], @repository.find_by_merchant_id("0")
  end

  def test_finds_by_created_at
  	assert_equal @items[1], @repository.find_by_created_at("92")
  end

  def test_finds_by_updated_at
  	assert_equal @items[0], @repository.find_by_updated_at("99")
  end


  def test_finds_all_by_id
  	assert_equal 0, @repository.find_all_by_id("6").size
  end

  def test_finds_all_by_name
  	assert_equal 1, @repository.find_all_by_name("tree").size
  end

  def test_finds_all_by_description
  	assert_equal 2, @repository.find_all_by_description("aa").size
  end

  def test_finds_all_by_unit_price
  	assert_equal 1, @repository.find_all_by_unit_price("2").size
  end

  def test_finds_all_by_merchant_id
  	assert_equal 2, @repository.find_all_by_merchant_id("5").size
  end

  def test_finds_all_by_created_at
  	assert_equal 1, @repository.find_all_by_created_at("64").size
  end

  def test_finds_all_by_updated_at
  	assert_equal 2, @repository.find_all_by_updated_at("103").size
  end
end
