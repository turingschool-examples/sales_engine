require_relative 'test_helper'

class ItemRepositoryTest < Minitest::Test 
	attr_reader :item_repository

	def setup
		file_path = "./test/support/test_items.csv"
		@item_repository = ItemRepository.new(file_path)
	end

	def test_instantiates_with_items_array
		setup

		assert_equal 14, item_repository.items.count
	end

	def test_returns_all_items
		setup

		assert_equal item_repository.items.count, item_repository.all.count
	end

	def test_returns_a_random_item
		setup
		random_instance = item_repository.random

		assert_equal 1, random_instance.count
	end

	def test_finds_by_missing_value_returns_an_empty_array
		setup
		found_item = item.repository.find_by_id("1000000")

		assert_equal [], found_item
	end

		def test_finds_all_by_missing_value_returns_an_empty_array
		setup
		found_item = item.repository.find_all_by_id("1000000")

		assert_equal [], found_item
	end

	def test_finds_by_id
		setup
		found_item = item.repository.find_by_id("4")

		assert_equal "item nemo facere", found_item.name
	end	

	def test_finds_by_name
		setup
		found_item = item.repository.find_by_name("Item Expedita Fuga")

		assert_equal "7", found_item.id
	end	

	def test_finds_by_description
		setup
		found_item = item.repository.find_by_description("sunt eum id eius magni consequuntur delectus veritatis. quisquam laborum illo ut ab. ducimus in est id voluptas autem.")

		assert_equal "4", found_item.id
	end	

	def test_finds_by_unit_price
		setup
		found_item = item.repository.find_by_unit_price("67076")

		assert_equal "2", found_item.id
	end	

	def test_finds_by_merchant_id
		setup
		found_item = item.repository.find_by_merchant_id("1")

		assert_equal "1", found_item.id
	end

	def test_finds_by_create_date
		setup
		found_item = item.repository.find_by_merchant_id("2012-03-27")

		assert_equal "1", found_item.id
	end

	def test_finds_by_update_date
		setup
		found_item = item.repository.find_by_merchant_id("2012-03-27")

		assert_equal "1", found_item.id
	end

	def test_finds_all_by_merchant_id
		setup
		found_items = item.repository.find_all_by_id("1")

		assert_equal 14, found_items.count
		assert_equal "item itaque consequatur", found_items[13].name
	end
end