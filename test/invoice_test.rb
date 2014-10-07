require_relative 'test_helper'

class InvoiceItemTest < Minitest::Test 

	attr_reader :invoice

	def setup
		data = {id: "1",
						customer_id: "1",
						merchant_id: "26",
						status: "shipped",
						created_at: "2012-03-25 09:54:09 UTC",
						updated_at: "2012-03-25 09:54:09 UTC"
						}

		@invoice = Invoice.new(data)
	end

	def test_invoice_has_an_id
		setup
		assert_equal "1", invoice.id
	end

	def test_invoice_item_has_an_customer_id
		setup
		assert_equal "1", invoice.customer_id
	end

	def test_invoice_item_has_an_merchant_id
		setup
		assert_equal "26", invoice.merchant_id
	end

	def test_invoice_item_has_a_status
		setup
		assert_equal "shipped", invoice.status
	end

	def test_invoice_item_has_metadata
		setup
		assert_equal "2012-03-25", invoice.created_at
		assert_equal "2012-03-25", invoice.updated_at
	end

end