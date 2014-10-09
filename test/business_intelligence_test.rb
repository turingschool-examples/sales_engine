require_relative 'test_helper'
require_relative '../lib/merchant'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'
require_relative '../lib/transaction'
require_relative '../lib/merchant_repository'
require_relative '../lib/customer_repository'
require_relative '../lib/customer'
require 'bigdecimal'

class BusinessIntelligenceTest < Minitest::Test
  def test_merchant_repo_gets_merchants_with_most_items
    merchants = [Merchant.new({}), Merchant.new({}), Merchant.new({}), Merchant.new({})]
    merchants.zip([5, 7, 9, 3]).each do |pair|
      pair[0].give_items([""] * pair[1])
    end
    assert_equal [merchants[2], merchants[1]], MerchantRepository.new(merchants).most_items(2)
  end

  def test_gets_merchant_revenue
    merchant = Merchant.new({})
    invoices = [Invoice.new({}), Invoice.new({})]
    invoices[0].give_invoice_items [InvoiceItem.new({unit_price: "1", quantity: "4"}), InvoiceItem.new({unit_price: "2", quantity: "3"}), InvoiceItem.new({unit_price: "2", quantity: "2"})]
    invoices[1].give_invoice_items [InvoiceItem.new({unit_price: "1", quantity: "2"}), InvoiceItem.new({unit_price: "3", quantity: "1"}), InvoiceItem.new({unit_price: "4", quantity: "6"})]

    invoices[0].give_transactions [Transaction.new({result: "success"}), Transaction.new({result: "success"}), Transaction.new({result: "failed"})]
    invoices[1].give_transactions [Transaction.new({result: "failed"}), Transaction.new({result: "success"}), Transaction.new({result: "failed"})]

    merchant.give_invoices(invoices)
    assert_equal BigDecimal.new("13"), merchant.revenue
    assert_instance_of BigDecimal, merchant.revenue
  end

  def test_gets_customer_transactions
    customer = Customer.new({})
    invoices = [Invoice.new({}), Invoice.new({})]
    invoices[0].give_transactions [Transaction.new({result: "success"}), Transaction.new({result: "success"}), Transaction.new({result: "failed"})]
    invoices[1].give_transactions [Transaction.new({result: "failed"}), Transaction.new({result: "success"}), Transaction.new({result: "failed"})]
    all_invoices = customer.give_invoices(invoices)

    assert_equal 3, customer.invoices.transactions.size
  end

  def test_gets_favorite_merchant
    customer = Customer.new({})
    invoices = [Invoice.new({}), Invoice.new({}), Invoice.new({}), Invoice.new({})]
    invoices[0].give_transactions [Transaction.new({result: "success", merchant: "Mr. Pibb"}), Transaction.new({result: "success", merchant: "Mr. Pibb"}), Transaction.new({result: "failed", merchant: "Donnie Darko"})]
    invoices[1].give_transactions [Transaction.new({result: "failed", merchant: "Donnie Darko"}), Transaction.new({result: "success", merchant: "Donnie Darko"}), Transaction.new({result: "failed", merchant: "Donnie Darko"})]
    customer.give_invoices(invoices)
    merchants = customer.invoices.merchant[0..-1]

    assert_equal "Mr. Pibb", favorite_merchant(merchants)
  end
end
