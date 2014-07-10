gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction_repository'
require_relative '../lib/invoice_repository'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/item_repository'
require_relative '../lib/sales_engine'


class ItemRepositoryTest < Minitest::Test

  attr_reader :repository, :sales_engine

  def setup

    @repository = ItemRepository.load('test/fixtures/small_items.csv')
  end

  def test_find_by_id
    entry = repository.find_by_id(10)
    assert_equal 10, entry.id
  end

  def test_find_by_name
    entry = repository.find_by_name('Item Qui Esse')
    assert_equal "Item Qui Esse", entry.name
  end

  def test_find_by_merchant_id
    entry = repository.find_by_merchant_id(777)
    assert_equal 777, entry.merchant_id
  end


  def test_find_all_by_merchant_id
    entries = repository.find_all_by_merchant_id(999)
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal 999, entry.merchant_id
    end
  end

  def test_random
    entry = repository.random
    assert entry.respond_to?(:merchant_id)
  end

  def test_find_by_unit_price
    entry = repository.find_by_unit_price(BigDecimal.new("935.19"))
    assert_equal 'Item Dolorem Et', entry.name
  end

  def test_most_revenue
    @sales_engine = SalesEngine.new(nil, true)
    sales_engine.startup
    assert_equal ['Item Dolorem Et'], sales_engine.item_repository.most_revenue(1).map(&:name)
    assert_equal ['Item Dolorem Et', 'Item Rerum Saepe'], sales_engine.item_repository.most_revenue(2).map(&:name)
  end

end
