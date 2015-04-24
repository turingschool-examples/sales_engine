require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new
  end

  def test_that_merchant_repo_returns_merchant_object
    assert_equal true, engine.merchant_repo.is_a?(MerchantRepository)
  end

  def test_that_item_repo_returns_item_object
    assert_equal true, engine.item_repo.is_a?(ItemRepository)
  end

  def test_that_invoice_repo_return_invoice_object
    assert_equal true, engine.invoice_repo.is_a?(InvoiceRepository)
  end

  def test_that_transaction_repo_returns_transaction_object
    assert_equal true, engine.transaction_repo.is_a?(TransactionRepository)
  end

  def test_that_invoice_item_repo_returns_invoice_item_object
    assert_equal true, engine.invoice_item_repo.is_a?(InvoiceItemRepository)
  end
  
  def test_that_customer_repo_returns_customer_object
    assert_equal true, engine.customer_repo.is_a?(CustomerRepository)
  end

  def test_that_merchant_revenue_returns_total_revenue_for_that_merchant
    assert_equal "21067.77", engine.merchant_revenue("26")
  end

  def test_merchant_revenue_for_specific_date
    assert_equal "68175.0", engine.merchant_revenue_for_specific_date("26", "2012-03-28 14:54:09 UTC")
  end
end
