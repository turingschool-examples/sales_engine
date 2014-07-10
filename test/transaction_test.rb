gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction'
require_relative '../lib/invoice'
require_relative '../lib/merchant'


class TransactionTest < Minitest::Test
  def setup
    @merchant1    = Merchant.new(id: 1, name: 'Allison')
    @invoice1     = Invoice.new(merchant: @merchant1)
    @transaction1 = Transaction.new(invoice: @invoice1)
  end

  def test_it_has_merchants
    assert @transaction1.merchant == @merchant1
  end
end
