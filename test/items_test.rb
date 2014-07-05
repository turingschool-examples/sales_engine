gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items'

class ItemsTest < Minitest::Test

  # def test_unit_price_is_decimal
  #   item = Item.new(unit_price: '68723')
  #   assert_equal 687.23, item.unit_price
  # end
end
