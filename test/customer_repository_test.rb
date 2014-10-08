require_relative 'test_helper'

class CustomerRepositoryTest < Minitest::Test 
	attr_reader :customer_repository, :sales_engine

	def setup
		file_path = "./test/support/test_customers.csv"
		@sales_engine = Minitest::Mock.new
		repository = Minitest::Mock.new
		customers = CustomerParser.new(file_path, repository).all
		@customer_repository = CustomerRepository.new(customers, sales_engine)
	end

	def test_has_an_customer_array
		assert_equal 15, customer_repository.customers.count
	end

	def test_returns_all_items
		results = customer_repository.all

		assert_equal customer_repository.customers.count, results.count
	end

	def test_finds_by_id
		results = customer_repository.find_by_id("4")

		assert_equal "leanne", results.first_name
	end	

	def test_finds_by_first_name
		results = customer_repository.find_by_first_name("Dejon")

		assert_equal "9", results.id
	end	

	def test_finds_by_last_name
		results = customer_repository.find_by_last_name("Kris")

		assert_equal "11", results.id
	end

	def test_finds_by_create_date
		results = customer_repository.find_by_created_at("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_by_update_date
		results = customer_repository.find_by_updated_at("2012-03-27")

		assert_equal "1", results.id
	end

	def test_finds_all_by_created_at
		results = customer_repository.find_all_by_created_at("2012-03-27")

		assert_equal 15, results.count
		assert_equal "1", results[0].id
	end

	def test_finds_by_missing_value_returns_an_empty_array
		results = customer_repository.find_by_id("1000000")

		assert_empty results
	end

	def test_finds_all_by_missing_value_returns_an_empty_array
		results = customer_repository.find_all_by_id("1000000")

		assert_empty results
	end

	def test_delegates_find_invoices_for_to_sales_engine
		sales_engine.expect(:find_invoices_by_customer, [], ["1"])
		customer_repository.find_invoices_for("1")
		sales_engine.verify
	end

end