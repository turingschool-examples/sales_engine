require_relative 'test_helper'

class ParserTest < MiniTest::Test

	def test_loads_an_item_csv
		file_path = "./test/support/test_items.csv"
		items = ItemParser.new(file_path).all

		assert_equal "1", items[0].id
		assert_equal "item autem minima", items[1].name
		assert_equal "sunt officia eum qui molestiae. nesciunt quidem cupiditate reiciendis est commodi non. atque eveniet sed. illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. odio optio nisi rerum nihil ut.", items[2].description
		assert_equal "4291", items[3].unit_price
		assert_equal "1", items[4].merchant_id
		assert_equal "2012-03-27", items[5].created_at
		assert_equal "2012-03-27", items[6].updated_at
	end

	def test_loads_an_invoice_csv
		file_path = "./test/support/test_invoices.csv"
		invoices = InvoiceParser.new(file_path).all

		assert_equal "6", invoices[5].id
		assert_equal "1", invoices[1].customer_id
		assert_equal "78", invoices[2].merchant_id
		assert_equal "shipped", invoices[3].status
		assert_equal "2012-03-09", invoices[5].created_at
		assert_equal "2012-03-07", invoices[6].updated_at
	end

	def test_loads_an_invoice_item_csv
		file_path = "./test/support/test_invoice_items.csv"
		invoice_items = InvoiceItemParser.new(file_path).all

		assert_equal "1", invoice_items[0].id
		assert_equal "528", invoice_items[1].item_id
		assert_equal "1", invoice_items[2].invoice_id
		assert_equal "3", invoice_items[3].quantity
		assert_equal "79140", invoice_items[4].unit_price
		assert_equal "2012-03-27", invoice_items[5].created_at
		assert_equal "2012-03-27", invoice_items[6].updated_at
	end

	def test_loads_a_customer_csv
		file_path = "./test/support/test_customers.csv"
		customers = CustomerParser.new(file_path).all

		assert_equal "1", customers[0].id
		assert_equal "joey", customers[0].first_name
		assert_equal "ondricka", customers[0].last_name
		assert_equal "2012-03-27", customers[0].created_at
		assert_equal "2012-03-27", customers[0].updated_at
	end

	def test_loads_a_merchant_csv
		file_path = "./test/support/test_merchants.csv"
		merchants = MerchantsParser.new(file_path).all

		assert_equal "1", merchants[0].id
		assert_equal "schroeder-jerde", merchants[0].name
		assert_equal "2012-03-27", merchants[0].created_at
		assert_equal "2012-03-27", merchants[0].updated_at
	end

	def test_loads_a_transaction_csv
		file_path = "./test/support/test_transactions.csv"
		transactions = TransactionsParser.new(file_path).all

		assert_equal "1", transactions[0].id
		assert_equal "1", transactions[0].invoice_id
		assert_equal "4654405418249632", transactions[0].credit_card_number
		assert_equal "success", transactions[0].result
		assert_equal "2012-03-27", transactions[0].created_at
		assert_equal "2012-03-27", transactions[0].updated_at
	end

end
