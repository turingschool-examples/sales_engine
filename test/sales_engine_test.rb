require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new
  end

  def test_can_find_invoices_by_merchant_id

  end

  def test_can_find_all_successful_invoice_items
    assert_equal 12, engine.all_successful_invoice_items.length
  end
  def test_that_merchant_repo_returns_merchant_object
    assert_equal true, engine.merchant_repository.is_a?(MerchantRepository)
  end

  def test_that_item_repo_returns_item_object
    assert_equal true, engine.item_repository.is_a?(ItemRepository)
  end

  def test_that_invoice_repo_return_invoice_object
    assert_equal true, engine.invoice_repository.is_a?(InvoiceRepository)
  end

  def test_that_transaction_repo_returns_transaction_object
    assert_equal true, engine.transaction_repository.is_a?(TransactionRepository)
  end

  def test_that_invoice_item_repo_returns_invoice_item_object
    assert_equal true, engine.invoice_item_repository.is_a?(InvoiceItemRepository)
  end
  
  def test_that_customer_repo_returns_customer_object
    assert_equal true, engine.customer_repository.is_a?(CustomerRepository)
  end

  def test_find_invoices_by_merchant_id
    assert_equal 3, engine.find_invoices_by_merchant_id(1).length
  end

  def test_find_invoice_items_with_invoices
    assert_equal 4, engine.find_invoice_items_with_invoices(2).length
  end

  def test_find_all_invoice_items_with_multiple_invoices
    invoices = []
    invoices << engine.invoice_repository.find_by_id(1)
    invoices << engine.invoice_repository.find_by_id(2)
    assert_equal 12, engine.find_all_invoice_items_with_multiple_invoices(invoices).length
  end

  def test_calculate_revenue_of_invoice_items
    invoices = []
    invoices << engine.invoice_repository.find_by_id(1)
    invoices << engine.invoice_repository.find_by_id(2)
    invoice_items = engine.find_all_invoice_items_with_multiple_invoices(invoices)
    assert_equal "26356.9", engine.calculate_revenue_of_invoice_items(invoice_items).to_digits
  end

  def test_successful_invoices
    assert_equal 6, engine.successful_invoices.length
  end

  def test_successful_invoices_by_merchant_id
    assert_equal 1, engine.successful_invoices_by_merchant_id(26).length
  end

  def test_pending_invoices
    assert_equal 3, engine.pending_invoices(1).length
  end

  def test_find_all_customers_by_invoice_customer_id
    invoice = engine.invoice_repository.find_by_id(9)
    assert_equal 1, engine.find_all_customers_by_invoice_customer_id(invoice).length
  end

  def test_customers_with_pending_invoices
    assert_equal 1, engine.customers_with_pending_invoices(34).length
  end

  def test_successful_invoices_by_date
    assert_equal 1, engine.successful_invoices_by_date(26, Date.parse("2012-03-25 09:54:09 UTC")).length
  end
end
