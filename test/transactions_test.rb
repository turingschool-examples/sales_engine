require_relative 'test_helper'

class TransactionsTest < Minitest::Test

  attr_reader :transaction

  def setup
    data = {id: 1,
            invoice_id: 1,
            credit_card_number: 4654405418249632,
            credit_card_expiration_date: " ",
            result: "success",
            created_at: "2012-03-27 14:54:09 UTC",
            updated_at: "2012-03-27 14:54:09 UTC"
            }

    @transaction = Transactions.new(data)
  end

  def test_it_has_an_id
    setup
    assert_equal 1, transaction.id
  end

  def test_it_has_an_invoice_id
    setup
    assert_equal 1, transaction.invoice_id
  end

  def test_it_has_a_credit_card_number
    setup
    assert_equal 4654405418249632, transaction.credit_card_number
  end

  def test_it_has_no_credit_card_expiration_date
    setup
    assert_equal " ", transaction.credit_card_expiration_date
  end

  def test_it_has_a_result
    setup
    assert_equal "success", transaction.result
  end

  def test_an_item_has_meta_data
    setup
    assert_equal "2012-03-27", transaction.created_at
    assert_equal "2012-03-27", transaction.updated_at
  end

end
