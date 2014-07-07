gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'
require 'pry'

class InvoiceTest < Minitest::Test
  def test_revenue
    @invoice_item1 = InvoiceItem.new(quantity: '1', unit_price: '1234')
    @invoice_item2 = InvoiceItem.new(quantity: '2', unit_price: '4321')
    @invoice       = Invoice.new(invoice_items: [@invoice_item1, @invoice_item2], status: 'shipped')
    assert_equal BigDecimal.new('98.76'), @invoice.revenue
  end
end
