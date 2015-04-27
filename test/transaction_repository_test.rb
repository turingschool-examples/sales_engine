require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction_repository'
require './lib/load_data'
require './lib/sales_engine'

class TransactionRepositoryTest < Minitest::Test
  include LoadData

  attr_reader :t

  def setup
    @t = TransactionRepository.new(transaction_data("fixtures"), SalesEngine.new)
  end

  def test_find_all_transaction_objects
    assert_equal 38, t.all.length
  end

  def test_that_random_returns_random_transaction_object
    assert_equal true, t.random.is_a?(Transaction)
  end

  def test_find_invoice_by_invoice_id
    assert_equal 1 , t.find_invoice_by_invoice_id(1).id
  end

  def test_all_method
    assert_equal 38, t.all.length
  end

  def test_can_find_by_id
    assert_equal 1, t.find_by_id(1).invoice_id
  end

  def test_find_all_by_id
    assert_equal 1, t.find_all_by_id(1).length
  end

  def test_find_by_invoice_id
    assert_equal 1, t.find_by_invoice_id(1).id
  end

  def test_find_all_by_invoice_id
    assert_equal 3, t.find_all_by_invoice_id(12).length
  end

  def test_find_by_credit_card_number
    assert_equal 1, t.find_by_credit_card_number("4654405418249632").id
  end

  def test_find_all_by_credit_card_number
    assert_equal 1, t.find_all_by_credit_card_number("4654405418249632").length
  end

  def test_can_find_by_credit_card_expiration_date
    assert_equal nil, t.find_by_credit_card_expiration_date("")
  end

  def test_can_find_all_by_credit_card_expiration_date
    assert_equal [], t.find_all_by_credit_card_expiration_date("")
  end

  def test_can_find_by_result
    assert_equal 1, t.find_by_result("success").id
  end

  def test_can_find_all_by_result
    assert_equal 7, t.find_all_by_result("failed").length
  end

  def test_find_by_created_at
    assert_equal "4654405418249632", t.find_by_created_at("2012-03-27 14:54:09 UTC").cc_number
  end

  def test_find_all_by_created_at
    assert_equal 2, t.find_all_by_created_at("2012-03-27 14:54:09 UTC").length
  end

  def test_find_by_updated_at
    assert_equal "4654405418249632", t.find_by_updated_at("2012-03-27 14:54:09 UTC").cc_number
  end

  def test_find_all_by_updated_at
    assert_equal 2, t.find_all_by_updated_at("2012-03-27 14:54:09 UTC").length
  end
end
