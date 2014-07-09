gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction_repository'
require_relative '../lib/invoice_repository'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/item_repository'
require 'pry'

class ItemRepositoryTest < Minitest::Test

  attr_reader :repository

  def setup
    @repository = ItemRepository.load('test/fixtures/small_items.csv')
  end

  def test_find_by_id
    entry = repository.find_by_id(10)
    assert_equal 10, entry.id
  end

  def test_find_by_name
    entry = repository.find_by_name('Item Qui Esse')
    assert_equal "Item Qui Esse", entry.name
  end

  def test_find_by_merchant_id
    entry = repository.find_by_merchant_id(777)
    assert_equal 777, entry.merchant_id
  end


  def test_find_all_by_merchant_id
    entries = repository.find_all_by_merchant_id(999)
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal 999, entry.merchant_id
    end
  end

  def test_random
    entry = repository.random
    assert entry.respond_to?(:merchant_id)
  end

  def test_find_by_unit_price
    entry = repository.find_by_unit_price(BigDecimal.new("935.19"))
    assert_equal 'Item Dolorem Et', entry.name
  end

  def test_most_revenue
    # most_revenue(x) returns the top x item instances ranked by total revenue generated

    # BY TOTAL REVENUE GENERATED
    # transacction success?
    # that transaccion has only one invoice
    # inside all those invoices: invoice_items * quantity = item_revenue
    # sort_by -item_revenue[0...number-1]
    # id,name,description,unit_price,merchant_id,created_at,updated_at

    # 1 * 1001 + 11 * 1011 = 12122
    transaction1    = Transaction.new(result: 'success')
    invoice1        = Invoice.new(status: 'shipped', transactions: [transaction1])
    invoice_item1   = InvoiceItem.new(quantity: 1,  unit_price: 1001, invoice: invoice1)
    invoice_item11  = InvoiceItem.new(quantity: 11, unit_price: 1011, invoice: invoice1)
    item1           = Item.new(name: 'ten',    invoice_items: [invoice_item1])
    item11          = Item.new(name: 'eleven', invoice_items: [invoice_item11])

    # failed transaction
    transaction2    = Transaction.new(result: 'failed')
    invoice2        = Invoice.new(status: 'shipped', transactions: [transaction2])
    invoice_item2   = InvoiceItem.new(quantity: 2,  unit_price: 1002,  invoice: invoice2)
    invoice_item22  = InvoiceItem.new(quantity: 22, unit_price: 1022, invoice: invoice2)
    item2           = Item.new(name: 'twenty',     invoice_items: [invoice_item2])
    item22          = Item.new(name: 'twenty two', invoice_items: [invoice_item22])

    # 33 * 3003 = 99099
    transaction3    = Transaction.new(result: 'success')
    invoice3        = Invoice.new(status: 'shipped', transactions: [transaction3])
    invoice_item3   = InvoiceItem.new(quantity: 33, unit_price: 3003, invoice: [invoice3])
    item3           = Item.new(name: 'thirty', invoice_items: [invoice_item3])

    # failed transaction
    transaction4    = Transaction.new(result: 'failed')
    invoice4        = Invoice.new(status: 'shipped', transactions: [transaction4])
    invoice_item4   = InvoiceItem.new(quantity: 4, unit_price: 1004, invoice: invoice4)
    item4           = Item.new(name: 'forthy', invoice_items: [invoice_item4])

    repository      = ItemRepository.new([item1, item11, item2, item22, item3, item4])
    assert_equal ['thirty'], repository.most_revenue(1).map(&:name)
    assert_equal ['thirty', 'ten'], repository.most_revenue(2).map(&:name)
  end

end
