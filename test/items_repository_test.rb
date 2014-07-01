gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items_repository'
require 'pry'

class ItemsRepositoryTest < Minitest::Test

  attr_reader :repository

  def setup
    @repository ||= ItemsRepository.load
  end

  def test_find_by_id
    entries = repository.find_by_id('10')
    assert_equal 1, entries.length
    entries.each do |entry|
      assert_equal "10", entry.id
    end
  end

  def test_find_by_name
    entry = repository.find_by_name('Item Qui Esse')
    assert_equal "Item Qui Esse", entry.name
  end

  def test_find_by_unit_price
    entry = repository.find_by_unit_price('4291')
    assert_equal "4291", entry.unit_price
  end

  def test_find_all_by_unit_price
    entries = repository.find_all_by_unit_price('75107')
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal "75107", entry.unit_price
    end
  end

  def test_find_by_merchant_id
    entry = repository.find_by_merchant_id('777')
    assert_equal "777", entry.merchant_id
  end


  def test_find_all_by_merchant_id
    entries = repository.find_all_by_merchant_id('999')
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal "999", entry.merchant_id
    end
  end
end
