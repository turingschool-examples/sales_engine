require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice"

class InvoiceTest < Minitest::Test
  def test_invoice_object_exists_after_initialization
    invoice = Invoice.new
    assert invoice
  end

  def test_creates_invoice_object_with_empty_instance_variable
    invoice = Invoice.new
    assert_equal nil, invoice.id
  end
end
