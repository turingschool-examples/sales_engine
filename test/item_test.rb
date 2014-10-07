require_relative 'test_helper'

class ItemTest < Minitest::Test

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

    assert_equal "4", item.id
    assert_equal "Item Nemo Facere", item.name
    assert_equal "4291", item.unit_price
    assert_equal "1", item.merchant_id
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end
end
