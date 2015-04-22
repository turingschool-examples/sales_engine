require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant"

class MerchantTest < Minitest::Test

  def test_customer_exists
    assert Merchant.new
  end

  def test_creates_hash_upon_initialization
    m = Merchant.new
    assert m.hash
  end
end
