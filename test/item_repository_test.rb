require_relative 'test_helper'
require './lib/item_repository'
require './lib/csv_parser'
require './lib/sales_engine'

class ItemRepositoryTest < Minitest::Test

  def test_repo_gets_populated
    raw_csv = CSVParser.new.load_csv('./data/items_test.csv')
    item_repo = ItemRepository.new(SalesEngine.new)
    item_repo.populate_repository(raw_csv, Item)
    assert_instance_of Item, item_repo.repo[0], "not instance of Item"
    assert_instance_of Item, item_repo.repo[-1], "not instance of Item"
  end

  def test_find_by_id
    skip
  end

  def find_by_name
  end

  def find_by_description
  end
end
