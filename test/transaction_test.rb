require_relative 'test_helper'
require_relative '../lib/transaction'

class TransactionTest < Minitest::Test
	def setup
		@transaction = Transaction.new({
			id: 															"4",
			invoice_id: 											"98",
			credit_card_number:     					"6789 9987 0097 2323",
			credit_card_expiration_date:  		"03-2015",
			result:    												"paid",
			created_at:   										"2012-03-27 14:53:59 UTC",
			updated_at:    										"2013-04-27 14:57:59 UTC"
			})
	end

	def test_it_initializes_with_properties
		assert_equal "4", @transaction.id
		assert_equal "98", @transaction.invoice_id
		assert_equal "6789 9987 0097 2323", @transaction.credit_card_number
		assert_equal "03-2015", @transaction.credit_card_expiration_date
		assert_includes @transaction.created_at, "2012"
		assert_includes @transaction.updated_at, "2013"
	end
end
