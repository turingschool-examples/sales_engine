require_relative 'test_helper'

class ItemTest < Minitest::Test
  attr_reader :item

  def setup
    data = { id: "1",
             name: "Soap",
             description: "Minty fresh",
             price: "150",
             merchant_id: "1",
             created_at: "2012-03-27 14:53:59 UTC",
             updated_at: "2012-03-27 14:53:59 UTC" }

    @item = Item.new(data)
  end

  def test_it_has_an_id
    assert_equal 1, item.id
  end

  def test_it_has_a_name
    assert_equal "soap", item.name
  end

  def test_it_has_a_description
    assert_equal "minty fresh", item.description
  end

  def test_it_has_a_price
    assert_equal 150, item.price
  end

  def test_it_has_a_merchant_id
    assert_equal 1, item.merchant_id
  end

  def test_it_has_a_created_at_time
    assert_equal Time.parse("2012-03-27 14:53:59 UTC"), item.created_at
  end

  def test_it_has_an_updated_at_time
    assert_equal Time.parse("2012-03-27 14:53:59 UTC"), item.updated_at
  end
end
