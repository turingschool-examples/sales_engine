require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice'
require './lib/sales_engine'
require_relative './test_helper'


class InvoiceTest < Minitest::Test
  attr_reader :i

  def setup
    @i = SalesEngine.new.invoice_repository.find_by_id(1)
  end

  def test_invoice_object_exists_after_initialization
    assert i
  end

  def test_transactions_returns_all_transactions_with_invoice_id
    assert_equal 1, i.transactions.length
  end

  def test_invoice_items_returns_all_invoice_items_with_invoice_id
    assert_equal 8, i.invoice_items.length
  end

  def test_items_method_returns_all_items_with_invoice_id
    assert_equal 8, i.items.length
    assert_equal true, i.items.first.is_a?(Item)
  end

  def test_customer_method_returns_a_single_customer_with_id
    assert_equal "Joey", i.customer.first_name
  end

  def test_merchant_method_returns_a_single_merchant_with_id
    assert_equal "Balistreri, Schaefer and Kshlerin", i.merchant.name
  end

  def test_charge_adds_new_transaction_to_trans_repository
    engine = SalesEngine.new
    first_count = engine.transaction_repository.all.count
    invoice = engine.invoice_repository.find_by_id(1)
    invoice.charge(invoice_id: 1, credit_card_number: '1111222233334444',  credit_card_expiration_date: "10/14", result: "success")
    second_count = engine.transaction_repository.all.count
    assert_equal 1, second_count - first_count
  end
end
