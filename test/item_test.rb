require_relative 'test_helper'
require 'date'
require 'item'

class ItemTest < Minitest::Test

  def setup
    @item = Item.new({
      id:                                       "4",
      name:                      "Item Nemo Facere",
      description:        "Sunt eum id eius magni.",
      unit_price:                            "4291",
      merchant_id:                              "1",
      created_at:           "2012-03-27 145359 UTC",
      updated_at:         "2012-03-27 14:53:59 UTC"
      })
  end

  def test_successful_initialize_with_properties
    assert_equal                            "4", @item.id
    assert_equal             "Item Nemo Facere", @item.name
    assert_equal      "Sunt eum id eius magni.", @item.description
    assert_equal                         "4291", @item.unit_price
    assert_equal                            "1", @item.merchant_id
    assert_includes            @item.created_at, "2012"
    assert_includes            @item.updated_at, "2012"
  end
end
