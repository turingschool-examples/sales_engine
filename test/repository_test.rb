require_relative 'test_helper'
require './lib/csv_parser'
require './lib/repository'
require './lib/invoice_item'
require './lib/invoice_item_repository'

class RepositoryTest < Minitest::Test

  def test_it_can_load_an_id
    invoice_item_repository = InvoiceItemRepository.new
    @csv = CSVParser.new.load_csv("./data/invoice_items_test.csv")
    @invoice_item = InvoiceItem
    invoice_item_repository.populate_repository(@csv, @invoice_item)
    assert_equal 1, invoice_item_repository.repo[0].id
  end

end
