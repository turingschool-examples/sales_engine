require_relative 'test_helper.rb'
require_relative '../lib/transaction'
require 'time'

class TransactionTest < Minitest::Test
  def setup
    data = {
      id:                          '1',
      invoice_id:                  '2',
      credit_card_number:          '4.65441E+15',
      credit_card_expiration_date: '',
      result:                      'success',
      created_at:                  '2012-03-27 14:53:59 UTC',
      updated_at:                  '2012-03-27 14:53:59 UTC'
    }
    @transaction = Transaction.new(data, nil)
  end

  def test_transaction_attribute_matches
    assert_equal 1, @transaction.id
    assert_equal 2, @transaction.invoice_id
    assert_equal 4.65441E+15, @transaction.credit_card_number
    assert_equal '', @transaction.credit_card_expiration_date
    assert_equal 'success', @transaction.result
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @transaction.created_at
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @transaction.updated_at
  end
end
