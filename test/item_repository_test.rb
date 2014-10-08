require_relative 'test_helper'

class ItemRepositoryTest < Minitest::Test
	attr_reader :item_repository, :repository, :sales_engine

	def setup
		file_path = "./test/support/test_items.csv"
		@sales_engine = Minitest::Mock.new
		repository = Minitest::Mock.new
		items = ItemParser.new(file_path, repository).all
		@item_repository = ItemRepository.new(items, sales_engine)
	end

	def test_instantiates_with_items_array

		assert_equal 14,item_repository.items.count
	end

	def test_returns_all_items
		results = item_repository.all

		assert_equal item_repository.items.count, results.count
	end

	def test_returns_a_random_item
		skip
		results = item_repository.random

		assert_equal 1, results.count
	end

	def test_finds_by_missing_value_returns_an_empty_array
		skip
		results = item_repository.find_by_id("1000000")

		assert_empty results
	end

	def test_finds_all_by_missing_value_returns_an_empty_array
		results = item_repository.find_all_by_id("1000000")

		assert_empty results
	end

	def test_finds_by_id
		results = item_repository.find_by_id("4")

		assert_equal "item nemo facere", results.name
	end

	def test_finds_by_name
		results = item_repository.find_by_name("item expedita fuga")

		assert_equal "7", results.id
	end

	def test_finds_by_description
		results = item_repository.find_by_description("sunt eum id eius magni consequuntur delectus veritatis. quisquam laborum illo ut ab. ducimus in est id voluptas autem.")

		assert_equal "4", results.id
	end

	def test_finds_by_unit_price
		results = item_repository.find_by_unit_price("67076")

		assert_equal "2", results.id
	end

	def test_finds_by_merchant_id
		results = item_repository.find_by_merchant_id("1")

		assert_equal "1", results.id
	end

	def test_finds_by_created_date
		results = item_repository.find_by_created_at("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_by_updated_at
		results = item_repository.find_by_updated_at("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_all_by_merchant_id
		results = item_repository.find_all_by_merchant_id("1")

		assert_equal 14, results.count
		assert_equal "item itaque consequatur", results[13].name
	end
end
