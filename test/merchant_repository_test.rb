require_relative 'test_helper'

class ItemRepositoryTest < Minitest::Test 
	attr_reader :item_repository

	def setup
		file_path = "./test/support/test_merchants.csv"
		merchants = MerchantParser.new(file_path).all
	end

	def test_instantiates_with_items_array
		setup

		assert_equal 14,item_repository.items.count
	end

	def test_returns_all_items
		setup
		results = item_repository.all

		assert_equal item_repository.items.count, item_repository.results.count
	end

	def test_returns_a_random_item
		setup
		results = item_repository.random

		assert_equal 1, results.count
	end

	def test_finds_by_missing_value_returns_an_empty_array
		setup
		results = item_repository.find_by_id("1000000")

		assert_equal [], results
	end

		def test_finds_all_by_missing_value_returns_an_empty_array
		setup
		results = item_repository.find_all_by_id("1000000")

		assert_equal [], results
	end

	def test_finds_by_id
		setup
		results = item_repository.find_by_id("4")

		assert_equal "item nemo facere", results.name
	end	

	def test_finds_by_name
		setup
		results = item_repository.find_by_name("Item Expedita Fuga")

		assert_equal "7", results.id
	end	

	def test_finds_by_description
		setup
		results = item_repository.find_by_description("sunt eum id eius magni consequuntur delectus veritatis. quisquam laborum illo ut ab. ducimus in est id voluptas autem.")

		assert_equal "4", results.id
	end	

	def test_finds_by_unit_price
		setup
		results = item_repository.find_by_unit_price("67076")

		assert_equal "2", results.id
	end	

	def test_finds_by_merchant_id
		setup
		results = item_repository.find_by_merchant_id("1")

		assert_equal "1", results.id
	end

	def test_finds_by_create_date
		setup
		results = item_repository.find_by_merchant_id("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_by_update_date
		setup
		results = item_repository.find_by_merchant_id("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_all_by_merchant_id
		setup
		results = item_repository.find_all_by_id("1")

		assert_equal 14, results.count
		assert_equal "item itaque consequatur", found_items[13].name
	end
end