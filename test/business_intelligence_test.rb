require_relative 'test_helper'
require_relative '../lib/merchant'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'
require_relative '../lib/transaction'
require_relative '../lib/customer'
require_relative '../lib/merchant_repository'
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

  def test_gets_merchant_revenue_on_date
    merchant = Merchant.new({})
    invoices = [Invoice.new({}), Invoice.new({})]
    invoices[0].give_invoice_items [InvoiceItem.new({unit_price: "1", quantity: "4"}), InvoiceItem.new({unit_price: "2", quantity: "3"}), InvoiceItem.new({unit_price: "2", quantity: "2"})]
    invoices[1].give_invoice_items [InvoiceItem.new({unit_price: "1", quantity: "2"}), InvoiceItem.new({unit_price: "3", quantity: "1"}), InvoiceItem.new({unit_price: "4", quantity: "6"})]

    invoices[0].give_transactions [Transaction.new({result: "success", created_at: "2012-04-27 14:54:09 UTC"}), Transaction.new({result: "success", created_at: "2012-03-27 14:54:09 UTC"}), Transaction.new({result: "failed", created_at: "2012-03-27 14:54:09 UTC"})]
    invoices[1].give_transactions [Transaction.new({result: "failed", created_at: "2012-03-27 14:54:09 UTC"}), Transaction.new({result: "success", created_at: "2012-03-17 14:54:09 UTC"}), Transaction.new({result: "success", created_at: "2012-03-27 14:54:09 UTC"})]

    merchant.give_invoices(invoices)
    assert_equal BigDecimal.new("30"), merchant.revenue("2012-03-27 14:54:09 UTC")
    assert_instance_of BigDecimal, merchant.revenue("2012-03-27 14:54:09 UTC")
  end

  def test_merchant_repo_gets_merchants_with_most_revenue
    merchants = [FakeMerchant.new(12), FakeMerchant.new(81), FakeMerchant.new(56), FakeMerchant.new(94)]
    assert_equal [merchants[3], merchants[1], merchants[2]], MerchantRepository.new(merchants).most_revenue(3)
  end

  def test_gets_merchant_repo_revenue_on_date
    merchants = [FakeMerchant.new(12,"10-08"), FakeMerchant.new(81,"10-18"), FakeMerchant.new(56,"10-08"), FakeMerchant.new(94,"10-08")]
    assert_equal BigDecimal.new("162"), MerchantRepository.new(merchants).revenue("10-08")
  end

  def test_merchant_favorite_customer
    skip
    merchant = Merchant.new({})
    invoices = [Invoice.new({}), Invoice.new({}), Invoice.new({})]
    customers = [Customer.new({id: "1"}), Customer.new({id: "2"})]
    invoices[0].give_customer(customers[0])
    invoices[1].give_customer(customers[1])
    invoices[2].give_customer(customers[0])

    invoices[0].give_transactions [Transaction.new({result: "success"}), Transaction.new({result: "success"})]
    invoices[1].give_transactions [Transaction.new({result: "success"}), Transaction.new({result: "success"}), Transaction.new({result: "failed"}), Transaction.new({result: "success"})]
    invoices[2].give_transactions [Transaction.new({result: "success"}), Transaction.new({result: "success"})]
    merchant.give_invoices(invoices)

    assert_equal customers[0], merchant.favorite_customer
  end

  def test_merchant_customers_with_pending_invoices
  end
end

class FakeMerchant
  def initialize(revenue, date = nil)
    @revenue = BigDecimal(revenue.to_s)
    @date = date
  end

  def revenue(date = nil)
    @date == date ? @revenue : 0
  end
end
