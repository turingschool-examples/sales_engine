require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice_item"

class InvoiceItemTest < Minitest::Test

  def test_customer_exists
    assert InvoiceItem.new
  end

  def test_creates_hash_upon_initialization
    i = InvoiceItem.new
    assert i.hash
  end
end
