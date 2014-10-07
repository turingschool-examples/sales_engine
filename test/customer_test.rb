gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer'
require_relative '../lib/invoice'

class CustomerTest < Minitest::Test
	def setup
		@customer = Customer.new({
			id:   										"12",
			first_name:   						"Billy",
			last_name:  							"Sanchez",
			created_at:   						"2012-09-27 14:53:59 UTC",
			updated_at:  							"2012-11-20 14:53:59 UTC"
			})
	end

	def test_it_initializes_with_data_and_attributes
		assert_equal "12", @customer.id
		assert_equal "Billy", @customer.first_name 
		assert_equal "Sanchez", @customer.last_name
		assert_includes @customer.created_at, "2012"
		assert_includes @customer.updated_at, "2012"	
	end

	def test_it
end
