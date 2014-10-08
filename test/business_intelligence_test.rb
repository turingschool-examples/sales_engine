require_relative 'test_helper'
require_relative '../lib/merchant'
require_relative '../lib/item'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'
require_relative '../lib/transaction'
require_relative '../lib/merchant_repository'
require_relative '../lib/item_repository'
require 'bigdecimal'
require 'date'

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



  def test_item_repository_returns_x_number_of_highest_revenue_items
    items_repo = ItemRepository.new([
          Item.new({}),
          Item.new({}),
          Item.new({}),
          Item.new({})
                    ])
    items_repo.items[0].give_invoice_items([
          InvoiceItem.new({unit_price: "1", quantity: "2"}),
          InvoiceItem.new({unit_price: "3", quantity: "1"}),
          InvoiceItem.new({unit_price: "4", quantity: "6"})
                    ])
    items_repo.items[1].give_invoice_items([
          InvoiceItem.new({unit_price: "5", quantity: "10"}),
          InvoiceItem.new({unit_price: "9", quantity: "9"}),
          InvoiceItem.new({unit_price: "4", quantity: "11"})
                    ])
    items_repo.items[2].give_invoice_items([
          InvoiceItem.new({unit_price: "2", quantity: "10"}),
          InvoiceItem.new({unit_price: "6", quantity: "5"}),
          InvoiceItem.new({unit_price: "8", quantity: "11"})
                    ])
    items_repo.items[3].give_invoice_items([
          InvoiceItem.new({unit_price: "4", quantity: "10"}),
          InvoiceItem.new({unit_price: "10", quantity: "9"}),
          InvoiceItem.new({unit_price: "7", quantity: "11"})
                    ])

    assert_equal  29, items_repo.items[0].revenue
    assert_equal 175, items_repo.items[1].revenue
    assert_equal 138, items_repo.items[2].revenue
    assert_equal 207, items_repo.items[3].revenue

    top_2 = [items_repo.items[3], items_repo.items[1]]
    assert_equal top_2, items_repo.most_revenue(2)
  end

  def test_item_repository_returns_x_number_of_top_selling_items
    items_repo = ItemRepository.new([
          Item.new({}),
          Item.new({}),
          Item.new({}),
          Item.new({})
                    ])
    items_repo.items[0].give_invoice_items([
          InvoiceItem.new({quantity: "2"}),
          InvoiceItem.new({quantity: "1"}),
          InvoiceItem.new({quantity: "6"})
                    ])
    items_repo.items[1].give_invoice_items([
          InvoiceItem.new({quantity: "10"}),
          InvoiceItem.new({quantity: "9"}),
          InvoiceItem.new({quantity: "11"})
                    ])
    items_repo.items[2].give_invoice_items([
          InvoiceItem.new({quantity: "10"}),
          InvoiceItem.new({quantity: "5"}),
          InvoiceItem.new({quantity: "11"})
                    ])
    items_repo.items[3].give_invoice_items([
          InvoiceItem.new({quantity: "10"}),
          InvoiceItem.new({quantity: "9"}),
          InvoiceItem.new({quantity: "11"})
                    ])

    assert_equal  9, items_repo.items[0].times_sold
    assert_equal 30, items_repo.items[1].times_sold
    assert_equal 26, items_repo.items[2].times_sold
    assert_equal 30, items_repo.items[3].times_sold

    top_2 = [items_repo.items[3], items_repo.items[1]]
    assert_equal top_2, items_repo.most_items(2)
  end
#   ItemRepository
#
# most_revenue(x) returns the top x item instances ranked by total revenue generated
#     get revenue of each item instances then sort by revenue. return x number of highest
# most_items(x) returns the top x item instances ranked by total number sold
# Item
#
# best_day returns the date with the most sales for the given item using the invoice date

  def test_item_returns_best_selling_day
    items = [Item.new({}), Item.new({})]
    items[0].give_invoice_items([
          InvoiceItem.new({quantity: "10", created_at: "2012-03-23 14:54:09 UTC"}),
          InvoiceItem.new({quantity:  "9", created_at: "2012-03-24 14:54:09 UTC"}),
          InvoiceItem.new({quantity: "11", created_at: "2012-03-25 14:54:09 UTC"})
                    ])
    items[1].give_invoice_items([
          InvoiceItem.new({quantity: "12", created_at: "2012-03-23 14:54:09 UTC"}),
          InvoiceItem.new({quantity: "77", created_at: "2014-07-13 14:54:09 UTC"}),
          InvoiceItem.new({quantity: "16", created_at: "2013-06-13 14:54:09 UTC"})
                    ])

    assert_equal     3, items[0].best_day.mon
    assert_equal    25, items[0].best_day.mday
    assert_equal  2012, items[0].best_day.year

    assert_equal     7, items[1].best_day.mon
    assert_equal    13, items[1].best_day.mday
    assert_equal  2014, items[1].best_day.year
  end
end
