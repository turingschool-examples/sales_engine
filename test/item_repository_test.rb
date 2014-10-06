require_relative 'test_helper.rb'
require_relative '../lib/item_repository'
require 'bigdecimal'
require 'bigdecimal/util'
require 'time'

class ItemRepositoryTest < Minitest::Test
  def setup
    @repo = ItemRepository.new('test/data',nil)
    @data = {
      id: 1,
      name:         "item 1",
      description:  "stuff about 1",
      unit_price:   "75107".to_d,
      merchant_id:  1,
      created_at:   Time.parse("2012-03-27 14:53:59 UTC"),
      updated_at:   Time.parse("2012-03-27 14:53:59 UTC")
    }
  end

  def test_find_by_attribute
    @data.each do |attribute, data|
      assert_equal 1, @repo.send("find_by_#{attribute}", data).id
    end
  end

  def test_find_returns_nil_if_no_match
    assert_nil @repo.find_by_name("no name")
  end

  def test_single_find_all_matches
    attributes = [:id, :name, :description, :unit_price]
    attributes.each do |attribute|
      match = @repo.send("find_all_by_#{attribute}", @data[attribute])
      assert_kind_of Array, match
      assert_kind_of Item, match[0]
      assert_equal 1, match.size
    end
  end

  def test_duplicate_find_all_matches
    attributes = [:merchant_id, :created_at, :updated_at]
    attributes.each do |attribute|
      match = @repo.send("find_all_by_#{attribute}", @data[attribute])
      assert_kind_of Array, match
      assert_kind_of Item, match[0]
      assert_kind_of Item, match[1]
      assert_equal 2, match.size
    end
  end

  def test_find_all_returns_empty_array_if_no_match
    assert_equal [], @repo.find_all_by_name("no name")
  end

  def test_random_method_returns_one_instance
    result = @repo.random
    assert_kind_of Item, result
  end

  def test_all_method_returns_all_instances
    result = @repo.all
    assert_kind_of Array, result
    assert_kind_of Item, result[0]
    assert_equal 3, result.size
  end
end
