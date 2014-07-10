gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant'
require_relative '../lib/items'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'
require_relative '../lib/transaction'
require_relative '../lib/customer'
require 'pry'

class MerchantTest < Minitest::Test

  def setup
    @customer1     = Customer.new(id: 1, first_name: 'Allison ')
    @customer2     = Customer.new(id: 2)
    @customer3     = Customer.new(id: 3)
    @customer4     = Customer.new(id: 4)
    @transaction1  = Transaction.new(result: 'success')
    @transaction2  = Transaction.new(result: 'success')
    @transaction3  = Transaction.new(result: 'success')
    @transaction4  = Transaction.new(result: 'failed')
    @transaction5  = Transaction.new(result: 'failed')
    @transaction6  = Transaction.new(result: 'failed')
    @transaction7  = Transaction.new(result: 'success')
    @transaction8  = Transaction.new(result: 'success')
    @invoice_item1 = InvoiceItem.new(quantity: '2', unit_price: '777777')
    @invoice_item2 = InvoiceItem.new(quantity: '1', unit_price: '88888888')
    @invoice1      = Invoice.new(invoice_items: [@invoice_item1, @invoice_item2], transactions: [@transaction1, @transaction3], customer: @customer1, status: 'shipped', updated_at:'2012-03-25 09:54:09 UTC')
    @invoice_item3 = InvoiceItem.new(quantity: '2', unit_price: '777777')
    @invoice_item4 = InvoiceItem.new(quantity: '1', unit_price: '88888888')
    @invoice2      = Invoice.new(invoice_items: [@invoice_item3, @invoice_item4], transactions: [@transaction2, @transaction4], customer: @customer2, status: 'shipped', updated_at:'2012-03-21 13:54:10 UTC' )
    @invoice3      = Invoice.new(transactions: [@transaction5], customer: @customer3)
    @invoice4      = Invoice.new(transactions: [@transaction6], customer: @customer4)
    @invoice5      = Invoice.new(transactions: [@transaction7], customer: @customer1)
    @invoice6      = Invoice.new(transactions: [@transaction8], customer: @customer1)
    @merchant      = Merchant.new(invoices: [@invoice1, @invoice2, @invoice3, @invoice4, @invoice5, @invoice6])
  end

  def test_revenue_of_all_invoices
    assert_equal 1808888.84, @merchant.revenue
  end

  def test_revenue_on_date
    assert_equal 904444.42, @merchant.revenue(Date.parse('2012-03-21'))
  end

  def test_it_has_a_favorite_customer
    assert @merchant.favorite_customer == @customer1
  end

  def test_customers_with_pending_transactions
    # binding.pry
    assert @merchant.customers_with_pending_invoices == [@customer3, @customer4]
  end
end
