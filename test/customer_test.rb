require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'

class CustomerTest < Minitest::Test
  attr_reader :c

  def setup
    @c = Customer.new
    c.id = "1"
  end

  def test_invoices_returns_collection_of_invoices
    assert_equal 2, c.invoices.length
    assert_equal true, c.invoices.first.is_a?(Invoice)
  end

end
