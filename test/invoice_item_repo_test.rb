require_relative 'helper_test'
require './lib/invoice_item_repository'
require './lib/sales_engine'

class InvoiceItemRepoTest < Minitest::Test

  def test_repo_gets_populated
    raw_csv = CSVParser.new.load_csv('./data/invoice_items_test.csv')
    invoice_item_repository = InvoiceItemRepository.new(SalesEngine.new)
    invoice_item_repository.populate_repository(raw_csv, InvoiceItem)
    assert_instance_of InvoiceItem, invoice_item_repository.repository[0], "not instance of InvoiceItem"
    assert_instance_of InvoiceItem, invoice_item_repository.repository[-1], "not instance of InvoiceItem"
  end

end
