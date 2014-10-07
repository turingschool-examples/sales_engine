require_relative 'test_helper'
require './lib/item'

class ItemTest < Minitest::Test

  def test_entry_attributes

    item = Item.new

    item.id = 4
    item.name = "Item Nemo Facere"
    item.unit_price = 4291
    item.merchant_id = 1
    item.created_at = "2012-03-27 14:53:59 UTC"
    item.updated_at = "2012-03-27 14:53:59 UTC"

    assert_equal 4, item.id
    assert_equal "Item Nemo Facere", item.name
    assert_equal 4291, item.unit_price
    assert_equal 1, item.merchant_id
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

  def test_different_entry_attributes
    item = Item.new

    item.id = 8
    item.unit_price = 8888
    item.merchant_id = 0

    assert_equal 8, item.id
    assert_equal 8888, item.unit_price
    assert_equal 0, item.merchant_id
  end
end
