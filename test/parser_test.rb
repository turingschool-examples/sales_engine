require_relative 'test_helper'

class ParserTest < MiniTest::Test 

	def test_loads_an_item_csv
		repository_type = Item
		file_path = "./test/support/test_items.csv"
		parser = Parser.new(repository_type, file_path)

		assert_equal "1", parser.parsed_array[0].id
		assert_equal "item autem minima", parser.parsed_array[1].name
		assert_equal "sunt officia eum qui molestiae. nesciunt quidem cupiditate reiciendis est commodi non. atque eveniet sed. illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. odio optio nisi rerum nihil ut.", parser.parsed_array[2].description
		assert_equal "4291", parser.parsed_array[3].unit_price
		assert_equal "1", parser.parsed_array[4].merchant_id
		assert_equal "2012-03-27", parser.parsed_array[5].created_at
		assert_equal "2012-03-27", parser.parsed_array[6].updated_at
	end

	def test_loads_an_invoice_csv
		repository_type = Invoice
		file_path = "./test/support/test_invoices.csv"
		parser = Parser.new(repository_type, file_path)

		assert_equal "6", parser.parsed_array[5].id
		assert_equal "1", parser.parsed_array[1].customer_id
		assert_equal "78", parser.parsed_array[2].merchant_id
		assert_equal "shipped", parser.parsed_array[3].status
		assert_equal "2012-03-07", parser.parsed_array[5].created_at
		assert_equal "2012-03-09", parser.parsed_array[6].updated_at
	end

	def test_loads_an_invoice_item_csv
		repository_type = InvoiceItem
		file_path = "./test/support/test_invoice_items.csv"
		parser = Parser.new(repository_type, file_path)

		assert_equal "1", parser.parsed_array[0].id
		assert_equal "528", parser.parsed_array[1].item_id
		assert_equal "1", parser.parsed_array[2].invoice_id
		assert_equal "3", parser.parsed_array[3].quantity
		assert_equal "79140", parser.parsed_array[4].unit_price
		assert_equal "2012-03-27", parser.parsed_array[5].created_at
		assert_equal "2012-03-27", parser.parsed_array[6].updated_at

	end

	def test_loads_a_customer_csv
		skip
	end

	def test_loads_a_merchant_csv
		skip
	end

	def test_loads_a_transaction_csv
		skip
	end

end