require_relative 'test_helper'

class InvoiceTest < Minitest::Test 

	attr_reader :invoice, :repository

	def setup
		data = {id: "1",
						customer_id: "1",
						merchant_id: "26",
						status: "shipped",
						created_at: "2012-03-25 09:54:09 UTC",
						updated_at: "2012-03-25 09:54:09 UTC"
						}
		@repository = Minitest::Mock.new
		@invoice = Invoice.new(data, repository)
	end

	def has_a_repository
		assert invoice.repository
	end

	def test_invoice_has_an_id
		assert_equal "1", invoice.id
	end

	def test_invoice_item_has_an_customer_id
		assert_equal "1", invoice.customer_id
	end

	def test_invoice_item_has_an_merchant_id
		assert_equal "26", invoice.merchant_id
	end

	def test_invoice_item_has_a_status
		assert_equal "shipped", invoice.status
	end

	def test_invoice_item_has_metadata
		assert_equal "2012-03-25", invoice.created_at
		assert_equal "2012-03-25", invoice.updated_at
	end

	def test_it_delegates_transaction_to_repository
		repository.expect(:find_transactions_for, [], ["1"])
		invoice.transactions
		repository.verify
	end

	def test_it_delegates_invoice_items_to_repository
		repository.expect(:find_invoice_items_for, [], ["1"])
		invoice.invoice_items
		repository.verify
	end

	def test_it_delegates_items_to_repository
		repository.expect(:find_items_for, [], ["1"])
		invoice.items
		repository.verify
	end

	def test_it_delegates_customer_to_repository
		repository.expect(:find_customer_for, [], ["1"])
		invoice.customer
		repository.verify
	end

	def test_it_delegates_customer_to_repository
		repository.expect(:find_merchant_for, [], ["1"])
		invoice.merchant
		repository.verify
	end

end