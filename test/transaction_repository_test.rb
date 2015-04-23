require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  attr_reader :t

  def setup
    @t = TransactionRepository.new
  end

  def test_that_random_returns_random_transaction_object
    assert_equal true, t.random.is_a?(Transaction)
  end

  def test_can_find_by_id
    assert_equal "1", t.find_by_id("1").invoice_id
  end

  def test_find_all_by_id
    assert_equal 1, t.find_all_by_id("1").length
  end

  def test_find_by_invoice_id
    assert_equal "1", t.find_by_invoice_id("1").id
  end

  def test_find_all_by_invoice_id
    assert_equal 3, t.find_all_by_invoice_id("12").length
  end

  def test_find_by_cc_number
    assert_equal "1", t.find_by_cc_number("4654405418249632").id
  end

  def test_find_all_by_cc_number
    assert_equal 1, t.find_all_by_cc_number("4654405418249632").length
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
