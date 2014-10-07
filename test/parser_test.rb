require_relative 'test_helper'

class ParserTest < MiniTest::Test 

	def test_loads_an_item_csv
		repository_type = "item"

		file_path = "./test/support/test_items.csv"
		parser = Parser.new(repository_type, file_path)

		assert_equal 1, parser.items[0].id
		assert_equal 1, items[2].name
		assert_equal 1, items[3].description
		assert_equal 1, items[4].unit_price
		assert_equal 1, items[2].merchant_id
		assert_equal 1, items[2].created_at
		assert_equal 1, items[2].updated_at
		
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