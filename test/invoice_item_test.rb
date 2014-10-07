require_relative 'test_helper'

class InvoiceItemTest < Minitest::Test 

	attr_reader :invoice_item

	def setup
		data = {id: "1",
						item_id: "539",
						invoice_id: "1",
						quantity: "5",
						unit_price: "13635",
						created_at: "2012-03-27 14:54:09 UTC",
						updated_at: "2012-03-27 14:54:09 UTC"
						}

		@invoice_item = InvoiceItem.new(data)
	end

	def test_invoice_item_has_an_id
		setup
		assert_equal "1", invoice_item.id
	end

	def test_invoice_item_has_an_item_id
		setup
		assert_equal "539", invoice_item.item_id
	end

	def test_invoice_item_has_an_invoice_id
		setup
		assert_equal "1", invoice_item.invoice_id
	end

	def test_invoice_item_has_a_quantity
		setup
		assert_equal "5", invoice_item.quantity
	end

	def test_invoice_item_has_an_unit_price
		setup
		assert_equal "13635", invoice_item.unit_price
	end

	def test_invoice_item_has_metadata
		setup
		assert_equal "2012-03-27", invoice_item.created_at
		assert_equal "2012-03-27", invoice_item.updated_at
	end

end