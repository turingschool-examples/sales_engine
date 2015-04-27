require 'minitest/autorun'
require 'minitest/pride'
require './lib/item_repository'
require './lib/sales_engine'
require './lib/load_data'
require 'bigdecimal'
require 'bigdecimal/util'

class ItemRepositoryTest < Minitest::Test
  include LoadData

  attr_reader :i

  def setup
    @i = ItemRepository.new(item_data("fixtures"), SalesEngine.new)
  end

  def test_all_method
    assert_equal 21, i.all.length
  end

  def test_that_random_returns_random_item_object
    assert_equal true, i.random.is_a?(Item)
  end

  def test_can_find_by_id
    assert_equal 1, i.find_by_id(1).id
  end

  def test_find_all_by_id
    assert_equal 1, i.find_all_by_id(1).length
  end

  def test_find_by_name
    assert_equal "Item Qui Esse", i.find_by_name("Item Qui Esse").name
  end

  def test_find_all_by_name
    assert_equal 1, i.find_all_by_name("Item Qui Esse").length
  end

  def test_find_by_description
    assert_equal 13, i.find_by_description("Nostrum doloribus quia. Expedita vitae beatae cumque. Aut ut illo aut eum.").id
  end

  def test_find_all_by_description
    assert_equal 1, i.find_all_by_description("Nostrum doloribus quia. Expedita vitae beatae cumque. Aut ut illo aut eum.").length
  end

  def test_find_by_unit_price
    assert_equal 1, i.find_by_unit_price(BigDecimal.new("75107") / 100).id
  end

  def test_find_all_by_unit_price
    assert_equal 1, i.find_all_by_unit_price(BigDecimal.new("75107") / 100).length
  end

  def test_find_by_merchant_id
    assert_equal 16, i.find_by_merchant_id(2).id
  end

  def test_find_all_by_merchant_id
    assert_equal 2, i.find_all_by_merchant_id(2).length
  end

  def test_find_by_created_at
    assert_equal 1, i.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_created_at
    assert_equal 13, i.find_all_by_created_at("2012-03-27 14:53:59 UTC").length
  end

  def test_find_by_updated_at
    assert_equal 1, i.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_updated_at
    assert_equal 13, i.find_all_by_updated_at("2012-03-27 14:53:59 UTC").length
  end

  def test_find_invoice_items_by_item_id
    assert_equal 2, i.find_invoice_items_by_item_id(13).length
  end

  def test_find_merchant_by_id
    assert_equal "Willms and Sons", i.find_merchant_by_id(3).name
  end
end
