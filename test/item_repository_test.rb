require_relative 'helper_test'
require './lib/item_repository'
require './lib/csv_parser'
require './lib/sales_engine'

class ItemRepositoryTest < Minitest::Test

  def test_repo_gets_populated
    item_repository = ItemRepository.new(SalesEngine.new, "./data")
    item_repository.make_repo
    assert_instance_of Item, item_repository.repository[0], "not instance of Item"
    assert_instance_of Item, item_repository.repository[-1], "not instance of Item"
  end

  def test_find_by_id
  end

  def find_by_name
  end

  def find_by_description
  end
end
