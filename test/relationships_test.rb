# require_relative 'test_helper'

gem 'minitest'
require 'minitest/autorun'

require_relative '../lib/sales_engine'
require_relative '../lib/merchant'
require_relative '../lib/invoice'
require_relative '../lib/invoice_item'
require_relative '../lib/item'
require_relative '../lib/customer'
require_relative '../lib/transaction'

class RelationshipsTest < Minitest::Test
  def setup
    @engine = SalesEngine.new
    @engine.startup(TestReader.new)
  end

  def test_
    assert @engine
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
    [ Invoice.new({id: "1", customer_id: "", merchant_id: ""}),
      Invoice.new({id: "2", customer_id: "", merchant_id: ""}),
      Invoice.new({id: "3", customer_id: "", merchant_id: ""})]
  end

  def make_items
    [ Item.new({id: "1", merchant_id: ""}),
      Item.new({id: "2", merchant_id: ""}),
      Item.new({id: "3", merchant_id: ""})]
  end

  def make_invoice_items
    [ InvoiceItem.new({id: "1", item_id: "", invoice_id: ""}),
      InvoiceItem.new({id: "2", item_id: "", invoice_id: ""}),
      InvoiceItem.new({id: "3", item_id: "", invoice_id: ""})]
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
