require_relative 'test_helper.rb'
require_relative '../lib/item'
require 'bigdecimal'
require 'bigdecimal/util'
require 'time'

class ItemTest < Minitest::Test
  def setup
    data = {
      id:           '1',
      name:         'Qui Esse',
      description:  'Nihil autem sit odio inventore deleniti',
      unit_price:   '75107',
      merchant_id:  '1',
      created_at:   '2012-03-27 14:53:59 UTC',
      updated_at:   '2012-03-27 14:53:59 UTC'
    }
    @item = Item.new(data, nil)
  end

  # def test_correct_attribute_array
  #   assert_equal @item.attributes, [
  #     :id,
  #     :name,
  #     :description,
  #     :unit_price,
  #     :merchant_id,
  #     :created_at,
  #     :updated_at
  #   ]
  # end

  def test_item_attribute_matches
    assert_equal 1, @item.id
    assert_equal 'Qui Esse', @item.name
    assert_equal 'Nihil autem sit odio inventore deleniti', @item.description
    assert_equal '75107'.to_d, @item.unit_price
    assert_equal 1, @item.merchant_id
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @item.created_at
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @item.updated_at
  end
end
