require_relative 'test_helper'
require './lib/item_repository'
require './lib/csv_parser'

class ItemRepositoryTest < Minitest::Test

  def test_repo_gets_populated
    raw_csv = CSVParser.new.load_csv('./data/items_test.csv')
    item_repo = ItemRepository.new
    item_repo.populate_repository(raw_csv, Item)
    assert_instance_of Item, item_repo.repo[1], "not instance of Item"
  end

end
