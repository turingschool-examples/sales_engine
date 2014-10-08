require_relative 'test_helper'

class CustomerTest < Minitest::Test

	attr_reader :customer, :repository

	def setup
		data = {id: "1",
						first_name: "Joey",
						last_name: "Ondricka",
						created_at: "2012-03-27 14:54:09 UTC",
						updated_at: "2012-03-27 14:54:09 UTC"
						}
		@repository = Minitest::Mock.new
		@customer = Customer.new(data, repository)
	end

	def test_customer_has_a_repository
		assert customer.repository
	end

	def test_customer_has_an_id
		assert_equal "1", customer.id
	end	

	def test_customer_has_a_first_name
		assert_equal "joey", customer.first_name
	end
	
	def test_customer_has_a_last_name
		assert_equal "ondricka", customer.last_name
	end
	
	def test_customer_has_metadata
		assert_equal "2012-03-27", customer.created_at
		assert_equal "2012-03-27", customer.updated_at
	end

	def test_delegates_invoices_to_repository
		repository.expect(:find_invoices_for, [], ["1"])
		customer.invoices
		repository.verify
	end
end