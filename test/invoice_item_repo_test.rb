require_relative 'test_helper'
require './lib/invoice_item_repository'

class InvoiceItemRepoTest < Minitest::Test

def test_repo_gets_populated
  raw_csv = CSVParser.new.load_csv('./data/invoice_items_test.csv')
  invoice_item_repo = InvoiceItemRepository.new
  invoice_item_repo.populate_repository(raw_csv, InvoiceItem)
  assert_instance_of InvoiceItem, invoice_item_repo.repo[0], "not instance of InvoiceItem"
  assert_instance_of InvoiceItem, invoice_item_repo.repo[-1], "not instance of InvoiceItem"
end

end
