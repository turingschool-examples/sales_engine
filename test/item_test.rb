require_relative 'test_helper'

class ItemTest < Minitest::Test
  attr_reader :item

  def test_entry_attributes
    data = { id: "4",
             name: "Item Nemo Facere",
             description: "Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.",
             unit_price: "4291",
             merchant_id: "1",
             created_at: "2012-03-27 14:53:59 UTC",
             updated_at: "2012-03-27 14:53:59 UTC"
           }

    @item = Item.new(data)
  end

  def test_item_has_an_id
    assert_equal "4", item.id
  end

  def test_item_has_a_name
    assert_equal "Item Nemo Facere", item.name
  end

  def test_item_has_a_description
    assert_includes? "Stunt eum id eius magni", item.description
  end

  def test_item_has_a_unit_price
    assert_equal "4291", item.unit_price
  end

  def test_item_has_merchant_id
    assert_equal "1", item.merchant_id
  end

  def test_item_created_at
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_item_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

end
