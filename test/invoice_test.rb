require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
	def setup
		@invoice = Invoice.new ({
			id:     									"7",
			customer_id:    					"99-111",
			merchant_id:  						"008-8887",
			status:   								"paid",
			created_at:   						"2012-03-27 14:53:59 UTC",
			updated_at:  							"2012-04-27 14:53:59 UTC"
			})
	end

	def test_it_initializes_with_properties
		assert_equal "7", @invoice.id
		assert_equal "99-111", @invoice.customer_id
		assert_equal "008-8887", @invoice.merchant_id
		assert_equal "paid", @invoice.status
		assert_includes @invoice.created_at, "2012"
		assert_includes @invoice.updated_at, "2012"
	end
end
