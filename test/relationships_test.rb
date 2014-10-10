require_relative 'helper_test'
require './lib/sales_engine'

class RelationshipsTest < Minitest::Test

  def setup
    sales_engine             = SalesEngine.new#(test data dir)
    sales_engine.startup #change to test files
    @item_repository         = sales_engine.item_repository
    @merchant_repository     = sales_engine.merchant_repository
    @invoice_item_repository = sales_engine.invoice_item_repository
    @invoice_repository      = sales_engine.invoice_repository
    @transaction_repository  = sales_engine.transaction_repository
    @customer_repository     = sales_engine.customer_repository
  end

  def test_item_find_by_merchant_method
   item = @item_repository.repository[0]
   assert_instance_of Merchant, item.merchant
  end

  def test_item_find_by_invoice_item_id_method
    item = @item_repository.repository.first
    assert_instance_of InvoiceItem, item.invoice_item
  end

  def test_invoice_item_find_by_invoice_id_method
    #invoice item repository will need to tell sales_engine to search invoices and find all invoice items by invoice id
    invoice_item = @invoice_item_repository.repository.first
    assert_instance_of Invoice, invoice_item.invoice
  end

  def test_invoice_item_find_by_item_id_method
    invoice_item = @invoice_item_repository.repository.first
    assert_instance_of Item, invoice_item.item
  end

  def test_invoice_find_all_by_transaction_id_method
    invoice = @invoice_repository.repository.first
    assert_instance_of Transaction, invoice.transactions
  end

  def test_invoice_find_all_by_invoice_items_method
    invoice = @invoice_repository.repository.first
    assert_instance_of InvoiceItem, invoice.invoice_items
  end

  def test_invoice_find_all_by_item_id_method
    invoice = @invoice_repository.repository.first
    assert_instance_of Item, invoice.items
  end

  def test_invoice_find_by_customer_id_method
    invoice = @invoice_repository.repository.first
    assert_instance_of Customer, invoice.customer
  end

  def test_invoice_find_by_merchant_id_method
    invoice = @invoice_repository.repository.first
    assert_instance_of Merchant, invoice.merchant
  end

  def test_merchant_find_all_by_item_id_method
    merchant = @merchant_repository.repository.first
    assert_instance_of Item, merchant.items
  end

  def test_merchant_find_all_by_invoice_id_method
    merchant = @merchant_repository.repository.first
    assert_instance_of Invoice, merchant.invoices
  end

  def test_transaction_find_by_invoice_id_method
    transaction = @transaction_repository.repository.first
    assert_instance_of Invoice, transaction.invoice
  end

  def test_customer_find_all_by_invoice_id_method
    customer = @customer_repository.repository.first
    assert_instance_of Invoice, customer.invoices
  end

end
