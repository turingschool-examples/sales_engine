require_relative 'helper_test'
require './lib/sales_engine'

class RelationshipsTest < Minitest::Test

  def setup
    sales_engine          = SalesEngine.new
    sales_engine.startup #change to test files
    @item_repo             = sales_engine.item_repository
    merchant_repo         = sales_engine.merchant_repository
    @invoice_item_repository = sales_engine.invoice_item_repository

  end

  def test_item_merchant_method
   item = @item_repo.repo[0]
   assert_instance_of Merchant, item.merchant
  end

  def test_invoice_item_find_by_invoice_id_method
    #invoice item repo will need to tell sales_engine to search invoices and find all invoice items by invoice id
    invoice_item = @invoice_item_repository.repo.first
    assert_instance_of Invoice, invoice_item.invoice
  end

  def test_invoice_item_find_by_item_id_method
    invoice_item = @invoice_item_repository.repo.first
    assert_instance_of Item, invoice_item.item
  end

end
