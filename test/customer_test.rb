require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'
require './lib/sales_engine'

class CustomerTest < Minitest::Test
  attr_reader :c

  def setup
    @c = SalesEngine.new("data")
    @asdf = c.customer_repository.find_by_id(999)
  end

  def test_invoices_returns_collection_of_invoices
    assert_equal 2, @asdf.invoices.length
    assert_equal true, c.invoices.first.is_a?(Invoice)
  end
end
