require_relative 'test_helper'
require_relative '../lib/merchant'
require_relative '../lib/item'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'
require_relative '../lib/transaction'
require_relative '../lib/customer'
require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'
require 'bigdecimal'
require 'date'

class BusinessIntelligenceTest < Minitest::Test
  def test_merchant_repo_gets_merchants_with_most_items
    merchants = [FakeMerchant.new({}), FakeMerchant.new({}), FakeMerchant.new({}), FakeMerchant.new({})]
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

    invoices[0].give_transactions [Transaction.new({result: "success"})]
    invoices[1].give_transactions [Transaction.new({result: "failed"})]

    merchant.give_invoices(invoices)
    assert_equal BigDecimal.new("0.14"), merchant.revenue
    assert_instance_of BigDecimal, merchant.revenue
  end

  def test_gets_merchant_revenue_on_date
    merchant = Merchant.new({})
    invoices = [Invoice.new({created_at: "2012-03-27 14:54:09 UTC"}), Invoice.new({created_at: "2012-03-27 14:54:09 UTC"})]
    invoices[0].give_invoice_items [InvoiceItem.new({unit_price: "1", quantity: "4"}), InvoiceItem.new({unit_price: "2", quantity: "3"}), InvoiceItem.new({unit_price: "2", quantity: "2"})]
    invoices[1].give_invoice_items [InvoiceItem.new({unit_price: "1", quantity: "2"}), InvoiceItem.new({unit_price: "3", quantity: "1"})]

    invoices[0].give_transactions [Transaction.new({result: "success"})]
    invoices[1].give_transactions [Transaction.new({result: "success"})]

    merchant.give_invoices(invoices)
    assert_equal BigDecimal.new("0.19"), merchant.revenue(Date.parse "2012-03-27 14:54:09 UTC")
    assert_instance_of BigDecimal, merchant.revenue(Date.parse "2012-03-27 14:54:09 UTC")
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
    merchant = Merchant.new({})
    invoices = [Invoice.new({}), Invoice.new({}), Invoice.new({}), Invoice.new({}), Invoice.new({})]
    customers = [Customer.new({id: "1"}), Customer.new({id: "2"})]
    invoices[0].give_customer(customers[0])
    invoices[1].give_customer(customers[1])
    invoices[2].give_customer(customers[0])
    invoices[3].give_customer(customers[1])
    invoices[4].give_customer(customers[1])

    invoices[0].give_transactions [Transaction.new({result: "success"})]
    invoices[1].give_transactions [Transaction.new({result: "failed"}), Transaction.new({result: "success"})]
    invoices[2].give_transactions [Transaction.new({result: "success"})]
    invoices[3].give_transactions [Transaction.new({result: "failed"})]
    invoices[4].give_transactions [Transaction.new({result: "failed"})]
    merchant.give_invoices(invoices)

    assert_equal customers[0], merchant.favorite_customer
  end

  def test_merchant_customers_with_pending_invoices
    merchant = Merchant.new({})
    invoices = [Invoice.new({}), Invoice.new({}), Invoice.new({})]
    customers = [Customer.new({id: "1"}), Customer.new({id: "2"})]
    invoices[0].give_customer(customers[0])
    invoices[1].give_customer(customers[1])
    invoices[2].give_customer(customers[1])

    invoices[0].give_transactions [Transaction.new({result: "failed"}), Transaction.new({result: "success"})]
    invoices[1].give_transactions [Transaction.new({result: "failed"})]
    invoices[2].give_transactions [Transaction.new({result: "failed"}), Transaction.new({result: "failed"})]
    merchant.give_invoices(invoices)

    assert_equal [customers[1]], merchant.customers_with_pending_invoices
  end

  def test_item_repository_returns_x_number_of_highest_revenue_items
    items_repo = ItemRepository.new([FakeItem.new(12), FakeItem.new(73), FakeItem.new(45), FakeItem.new(85)])

    assert_equal [85, 73], items_repo.most_revenue(2).collect(&:revenue)
  end

  def test_item_repository_returns_x_number_of_top_selling_items
    items_repo = ItemRepository.new([FakeItem.new(1, 52), FakeItem.new(1, 8), FakeItem.new(1, 2), FakeItem.new(1, 14)])
    assert_equal [52, 14, 8], items_repo.most_items(3).collect(&:times_sold)
  end

  def test_item_returns_best_selling_date
    items = [Item.new({}), Item.new({})]
    items[0].give_invoice_items [FakeInvoiceItem.new(FakeInvoice.new("2012-03-23 14:54:09 UTC"), 10), FakeInvoiceItem.new(FakeInvoice.new("2012-03-24 14:54:09 UTC"), 9), FakeInvoiceItem.new(FakeInvoice.new("2012-03-25 14:54:09 UTC"), 11)]
    items[1].give_invoice_items [FakeInvoiceItem.new(FakeInvoice.new("2012-03-23 14:54:09 UTC"), 12), FakeInvoiceItem.new(FakeInvoice.new("2014-07-13 14:54:09 UTC"), 77), FakeInvoiceItem.new(FakeInvoice.new("2012-06-13 14:54:09 UTC"), 16)]

    assert_equal Date.parse("2012-03-25 14:54:09 UTC"), items[0].best_day
    assert_equal Date.parse("2014-07-13 14:54:09 UTC"), items[1].best_day
  end

  def test_customers_return_array_of_associated_transaction_instances
    customers    = [Customer.new({id: 4}),Customer.new({id: 6}) ]
    invoices     = [Invoice.new({customer_id: 4}), Invoice.new({customer_id:6}), Invoice.new({customer_id: 4}) ]
    transactions = Array.new(20) { Transaction.new({}) }

    invoices[0].give_transactions(transactions[0..5] + transactions[16..19])
    invoices[1].give_transactions(transactions[6..15])
    customers[0].give_invoices([invoices[0]])
    customers[1].give_invoices([invoices[1]])

    assert_equal transactions[0..5] + transactions[16..19],  customers[0].transactions
    assert_equal  transactions[6..15],  customers[1].transactions
  end

  def test_customers_returns_merchant_with_most_successful_transactions
    customer     =  Customer.new({id: 4})
    merchants    = [Merchant.new({id: 5}), Merchant.new({id: 6})]
    invoices     = [Invoice.new({customer_id: 4, merchant_id: 5}), Invoice.new({customer_id:4, merchant_id: 6})]
    transactions = [ [Transaction.new({result: "success"})]*40, [Transaction.new({result: "failed"})]*30 ].flatten!.shuffle!

    invoices[0].give_merchant(merchants[0])
    invoices[1].give_merchant(merchants[1])
    invoices[0].give_transactions(transactions[0..30])
    invoices[1].give_transactions(transactions[31..50])
    transactions[0..30].each do |transaction|
      transaction.give_invoice(invoices[0])
    end
    transactions[31..50].each do |transaction|
      transaction.give_invoice(invoices[0])
    end

    customer.give_invoices(invoices)
    assert_equal merchants[0], customer.favorite_merchant

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

  def give_items(items)
    @items = items
  end

  def items_sold
    @items.count
  end
end

FakeItem = Struct.new :revenue, :times_sold

FakeInvoiceItem = Struct.new :invoice, :quantity
class FakeInvoiceItem
  def successful?
    true
  end
end

FakeInvoice = Struct.new :created_at
