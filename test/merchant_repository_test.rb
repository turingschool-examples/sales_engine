require_relative 'test_helper'

class MerchantRepositoryTest < Minitest::Test 
	attr_reader :merchant_repository

	def setup
		file_path = "./test/support/test_merchants.csv"
		merchants = MerchantsParser.new(file_path).all
		@merchant_repository = MerchantRepository.new(merchants)
	end

	def test_instantiates_with_merchants_array
		setup

		assert_equal 15, merchant_repository.merchants.count
	end

	def test_returns_all_items
		setup
		results = merchant_repository.all

		assert_equal merchant_repository.merchants.count, results.count
	end

	def test_finds_by_id
		setup
		results = merchant_repository.find_by_id("4")

		assert_equal "cummings-thiel", results.name
	end	

	def test_finds_by_name
		setup
		results = merchant_repository.find_by_name("Schroeder-Jerde")

		assert_equal "1", results.id
	end	

	def test_finds_by_create_date
		setup
		results = merchant_repository.find_by_created_at("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_by_update_date
		setup
		results = merchant_repository.find_by_updated_at("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_all_by_merchant_created_date
		setup
		results = merchant_repository.find_all_by_created_at("2012-03-27")

		assert_equal 15, results.count
		assert_equal "dicki-bednar", results[13].name
	end

	def test_finds_by_missing_value_returns_an_empty_array
		setup
		results = merchant_repository.find_by_id("1000000")

		assert_equal [], results
	end

	def test_finds_all_by_missing_value_returns_an_empty_array
		setup
		assert_empty merchant_repository.find_all_by_id("1000000")

		#assert_empty results
	end
end