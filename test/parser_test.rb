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

	end

	def test_loads_an_invoice_item_csv

	end

	def test_loads_a_customer_csv

	end

	def test_loads_a_merchant_csv

	end

	def test_loads_a_transaction_csv

	end

end