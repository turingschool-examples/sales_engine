require "minitest/autorun"
require "minitest/pride"
require "./lib/transaction"

class ItemTest < Minitest::Test

  def test_customer_exists
    assert Transaction.new
  end

  def test_creates_hash_upon_initialization
    i = Transaction.new
    assert i.hash
  end
end
