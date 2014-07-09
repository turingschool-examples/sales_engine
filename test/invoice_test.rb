gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'
require_relative '../lib/transaction'
require 'pry'

class InvoiceTest < Minitest::Test
  def test_revenue
    @transaction1  = Transaction.new(result: 'success')
    @transaction2  = Transaction.new(result: 'success')
    @invoice_item1 = InvoiceItem.new(quantity: '1', unit_price: '1234')
    @invoice_item2 = InvoiceItem.new(quantity: '2', unit_price: '4321')
    @invoice       = Invoice.new(invoice_items: [@invoice_item1, @invoice_item2], transactions: [@transaction1, @transaction2])
    assert_equal BigDecimal.new('98.76'), @invoice.revenue
  end
end
