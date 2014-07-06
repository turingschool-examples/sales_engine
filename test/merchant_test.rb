gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant'
require_relative '../lib/items'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'

class MerchantTest < Minitest::Test

  def setup
    @invoice_item1 = InvoiceItem.new(quantity: '2', unit_price: '777777')
    @invoice_item2 = InvoiceItem.new(quantity: '1', unit_price: '88888888')
    @invoice1 = Invoice.new(invoice_items: [@invoice_item1, @invoice_item2], status: 'shipped', updated_at:'2012-03-25 09:54:09 UTC')
    @invoice_item3 = InvoiceItem.new(quantity: '2', unit_price: '777777')
    @invoice_item4 = InvoiceItem.new(quantity: '1', unit_price: '88888888')
    @invoice2 = Invoice.new(invoice_items: [@invoice_item3, @invoice_item4], status: 'shipped', updated_at:'2012-03-21 13:54:10 UTC' )
    @merchant = Merchant.new(invoices: [@invoice1, @invoice2])
  end

  def test_revenue_of_all_invoices
    assert_equal 1808888.84, @merchant.revenue
  end

  def test_revenue_on_date
    assert_equal 904444.42, @merchant.revenue(Date.parse('2012-03-21'))
  end
end
