require_relative 'test_helper'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'
require_relative '../lib/item'
require_relative '../lib/customer'
require_relative '../lib/transaction'

class RelationshipsTest < Minitest::Test
  def setup
    @reader = TestReader.new
    @engine = SalesEngine.new
    @engine.startup(@reader)
  end

  def test_merchants_have_correct_relations
    assert_empty @reader.merchants[0].items
    assert_includes @reader.merchants[0].invoices, @reader.invoices[0]

    assert_includes @reader.merchants[1].items, @reader.items[1]
    assert_includes @reader.merchants[1].invoices, @reader.invoices[2]

    assert_includes @reader.merchants[2].items, @reader.items[0]
    assert_includes @reader.merchants[2].items, @reader.items[2]
    assert_includes @reader.merchants[2].invoices, @reader.invoices[1]
  end

  def test_invoices_have_correct_relations
  end

  def test_items_have_correct_relations
    assert_includes @reader.items[0].merchants, @reader.merchants[2]
    assert_includes @reader.items[0].invoice_items, @reader.invoice_items[0]
    assert_includes @reader.items[0].invoice_items, @reader.invoice_items[1]

    assert_includes @reader.items[1].merchants, @reader.merchants[1]
    assert_includes @reader.items[1].invoice_items, @reader.invoice_items[2]

    assert_includes @reader.items[2].merchants, @reader.merchants[2]
    assert_empty @reader.items[2].invoice_items
  end

  def test_invoice_items_have_correct_relations
  end

  def test_customers_have_correct_relations
  end

  def test_transactions_have_correct_relations
  end
end

class TestReader
  attr_reader :merchants, :invoices, :items,
              :invoice_items, :customers, :transactions

  def initialize
    @merchants = make_merchants
    @invoices = make_invoices
    @items = make_items
    @invoice_items = make_invoice_items
    @customers = make_customers
    @transactions = make_transactions
  end

  def read(file_location)
    send file_location.split(".")[0].to_sym
  end

  def make_merchants
    [ Merchant.new({id: "1"}),
      Merchant.new({id: "2"}),
      Merchant.new({id: "3"})]
  end

  def make_invoices
    [ Invoice.new({id: "1", customer_id: "1", merchant_id: "1"}),
      Invoice.new({id: "2", customer_id: "3", merchant_id: "3"}),
      Invoice.new({id: "3", customer_id: "2", merchant_id: "2"})]
  end

  def make_items
    [ Item.new({id: "1", merchant_id: "3"}),
      Item.new({id: "2", merchant_id: "2"}),
      Item.new({id: "3", merchant_id: "3"})]
  end

  def make_invoice_items
    [ InvoiceItem.new({id: "1", item_id: "1", invoice_id: ""}),
      InvoiceItem.new({id: "2", item_id: "1", invoice_id: ""}),
      InvoiceItem.new({id: "3", item_id: "2", invoice_id: ""})]
  end

  def make_customers
    [ Customer.new({id: "1"}),
      Customer.new({id: "2"}),
      Customer.new({id: "3"})]
  end

  def make_transactions
    [ Transaction.new({id: "1", invoice_id: ""}),
      Transaction.new({id: "2", invoice_id: ""}),
      Transaction.new({id: "3", invoice_id: ""})]
  end
end
