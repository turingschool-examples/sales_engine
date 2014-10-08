require_relative 'test_helper'

class MerchantRepositoryTest < Minitest::Test 
	attr_reader :merchant_repository, :sales_engine

	def setup
		file_path = "./test/support/test_merchants.csv"
		@sales_engine = Minitest::Mock.new
		repository = Minitest::Mock.new
		merchants = MerchantsParser.new(file_path, repository).all
		@merchant_repository = MerchantRepository.new(merchants, sales_engine)
	end

	def test_has_a_merchants_array
		assert_equal 15, merchant_repository.merchants.count
	end

	def test_returns_all_items
		results = merchant_repository.all

		assert_equal merchant_repository.merchants.count, results.count
	end

	def test_finds_by_id
		results = merchant_repository.find_by_id("4")

		assert_equal "cummings-thiel", results.name
	end	

	def test_finds_by_name
		results = merchant_repository.find_by_name("Schroeder-Jerde")

		assert_equal "1", results.id
	end	

	def test_finds_by_create_date
		results = merchant_repository.find_by_created_at("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_by_update_date
		results = merchant_repository.find_by_updated_at("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_all_by_merchant_created_date
		results = merchant_repository.find_all_by_created_at("2012-03-27")

		assert_equal 15, results.count
		assert_equal "dicki-bednar", results[13].name
	end

	def test_finds_by_missing_value_returns_an_empty_array
		skip
		results = merchant_repository.find_by_id("1000000")

		assert_equal [], results
	end

	def test_finds_all_by_missing_value_returns_an_empty_array
		skip
		assert_empty merchant_repository.find_all_by_id("1000000")

		assert_empty results
	end

	def test_delegates_find_invoices_for_to_sales_engine
		sales_engine.expect(:find_invoices_by_merchant, [], ["1"])
		merchant_repository.find_invoices_for("1")
		sales_engine.verify
	end

	def test_delegates_find_items_for_to_sales_engine
		sales_engine.expect(:find_items_by_merchant, [], ["1"])
		merchant_repository.find_items_for("1")
		sales_engine.verify
	end
end