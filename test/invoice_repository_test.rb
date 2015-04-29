require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_repository'
require './lib/sales_engine'
require './lib/load_data'
require './lib/item_repository'
require 'bigdecimal'
require 'date'
require_relative './test_helper'


class InvoiceRepositoryTest < Minitest::Test
  include LoadData

  attr_reader :i, :engine

  def setup
    @i = InvoiceRepository.new(load_csv("fixtures", "invoices.csv"), @engine = SalesEngine.new)
  end

  def test_that_random_returns_random_invoice_repository_object
    assert_equal true, i.random.is_a?(Invoice)
  end

  def test_find_by_id
    assert_equal 26, i.find_by_id(1).merchant_id
  end

  def test_find_all_by_id
    assert_equal 1, i.find_all_by_id(2).length
  end

  def test_find_by_customer_id
    assert_equal 9, i.find_by_customer_id(2).id
  end

  def test_find_all_by_customer_id
    assert_equal 4, i.find_all_by_customer_id(3).length
  end

  def test_find_by_merchant_id
    assert_equal true, i.find_by_merchant_id(3).is_a?(Invoice)
  end

  def test_find_all_merchant_id
    assert_equal 3, i.find_all_by_merchant_id(1).length
  end

  def test_find_by_status
    assert_equal true, i.find_by_status("shipped").is_a?(Invoice)
  end

  def test_find_all_by_status
    assert_equal 17, i.find_all_by_status("shipped").length
  end

  def test_find_by_created_at
    assert_equal 1894, i.find_by_created_at("2012-03-07 05:55:40 UTC").id
  end

  def test_find_all_by_created_at
    assert_equal 2, i.find_all_by_created_at("2012-03-07 06:54:23 UTC").length
  end

  def test_find_by_updated_at
    assert_equal 4437, i.find_by_updated_at("2012-03-27 13:57:55 UTC").id
  end

  def test_find_all_by_updated_at
    assert_equal 2, i.find_all_by_updated_at("2012-03-27 06:56:31 UTC").length
  end

  def test_find_transactions_by_invoice_id
    assert_equal 3, i.find_transactions_by_invoice_id(34).length
  end

  def test_find_invoice_items_by_invoice_id
    assert_equal 4, i.find_invoice_items_by_invoice_id(2).length
  end

  def test_find_customer_by_customer_id
    assert_equal "Heber", i.find_customer_by_customer_id(6).first_name
  end

  def test_find_merchant_by_merchant_id
    assert_equal "Cummings-Thiel", i.find_merchant_by_merchant_id(4).name
  end

  def test_find_items_by_item_id_through_invoice_items
    assert_equal "Item Voluptatem Sint", i.find_items_by_item_id_through_invoice_items(13).name
  end

  def test_inspect_returns_number_of_rows_in_repository
    assert_equal "#<InvoiceRepository 17 rows>", i.inspect
  end

  def test_all_returns_all_invoices
    assert_equal 17, i.all.length
  end

  def test_create_makes_invoices
    item1 = ItemRepository.new(load_csv("fixtures","items.csv"),SalesEngine.new).find_by_id(539)
    item2 = ItemRepository.new(load_csv("fixtures","items.csv"),SalesEngine.new).find_by_id(539)
    item3 = ItemRepository.new(load_csv("fixtures","items.csv"),SalesEngine.new).find_by_id(1)
    customer = CustomerRepository.new(load_csv("fixtures", "customers.csv"), SalesEngine.new).find_by_id(1)
    merchant = MerchantRepository.new(load_csv("fixtures", "merchants.csv"), SalesEngine.new).find_by_id(26)
    i.create(customer: customer, merchant: merchant, status: "shipped", items:[item1, item2, item3])
    assert_equal 4438, i.all.last.id
  end

  def test_add_transaction_adds_a_new_transaction
    i.add_transaction(id: 100, invoice_id: 101, credit_card_number: "4444333322221111", credit_card_expiration: "10/13", result: "success")
    assert_equal 100, engine.transaction_repository.all.last.id
  end

end
