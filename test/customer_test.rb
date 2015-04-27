require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class CustomerTest < Minitest::Test
  attr_reader :c

  def setup
    @c = SalesEngine.new.customer_repository.find_by_id(1)
  end

  def test_that_exists
    assert c
  end

  def test_that_customer_initializes_correctly
    assert_equal "Joey", c.first_name
    assert_equal "Ondricka", c.last_name
    assert_equal 1, c.id
  end

  def test_invoices_returns_collection_of_invoices
    assert_equal 2, c.invoices.length
    assert_equal true, c.invoices.first.is_a?(Invoice)
  end

  def test_transactions_returns_collection_of_transactions
    assert_equal 2, c.transactions.length
  end

  def test_favorite_merchant_returns_fave_merchant
    assert_equal 26, c.favorite_merchant.id
  end
end
