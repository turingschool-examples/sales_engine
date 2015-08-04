require "minitest/autorun"
require "minitest/pride"
require "./lib/customer"

class CustomerTest < Minitest::Test

  def test_customer_exists
    assert Customer.new
  end

  def test_creates_hash_upon_initialization
    customer = Customer.new
    assert customer.hash
  end
end
