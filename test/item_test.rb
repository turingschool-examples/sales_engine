require "minitest/autorun"
require "minitest/pride"
require "./lib/item"

class ItemTest < Minitest::Test

  def test_customer_exists
    assert Item.new
  end

  def test_creates_hash_upon_initialization
    i = Item.new
    assert i.hash
  end
end
