require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new
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
end
