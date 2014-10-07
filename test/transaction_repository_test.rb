require_relative 'test_helper'
require_relative '../lib/transaction_repository'
require_relative '../lib/transaction'

class TransactionRepositoryTest < Minitest::Test
  def setup
    transaction_one = Transaction.new {id: "1" invoice_id: "4" credit_card_number: "7" credit_card_expiration_date: "12" result: "fail" created_at: "b" updated_at: "q"}
    transaction_two = Transaction.new {id: "2" invoice_id: "5" credit_card_number: "8" credit_card_expiration_date: "13" result: "pass" created_at: "b" updated_at: "w"}
    transaction_three = Transaction.new {id: "3" invoice_id: "6" credit_card_number: "9" credit_card_expiration_date: "14" result: "pass" created_at: "c" updated_at: "q"}
    @transactions = [transaction_one, transaction_two, transaction_three]
    @repository = TransactionRepository.new(@transactions)
  end

  def test_returns_all
    assert_equal @transactions, @repository.all
  end

  def test_returns_random
    assert_instance_of Transaction, @repository.random
  end

  def test_finds_by_id
    assert_equal @transactions[0], @repository.find_by_id("1")
  end

  def test_finds_by_invoice_id
    assert_equal @transactions[1], @repository.find_by_invoice_id("5")
  end

  def test_finds_by_credit_card_number
    assert_equal @transactions[2], @repository.find_by_credit_card_number("9")
  end

  def test_finds_by_credit_card_expiration_date
    assert_equal @transactions[1], @repository.find_by_credit_card_expiration_date("13")
  end

  def test_finds_by_result
    assert_equal @transactions[0], @repository.find_by_result("fail")
  end

  def test_finds_by_created_at
    assert_equal @transactions[2], @repository.find_by_created_at("c")
  end

  def test_finds_by_updated_at
    assert_equal @transactions[1], @repository.find_by_updated_at("w")
  end

  def test_finds_all_by_id
    assert_equal 1, @repository.find_all_by_id("1").size
  end

  def test_finds_all_by_invoice_id
    assert_equal 0, @repository.find_all_by_invoice_id("pqweqwe").size
  end

  def test_finds_all_by_credit_card_number
    assert_equal 1, @repository.find_all_by_credit_card_number("9").size
  end

  def test_finds_all_by_credit_card_expiration_date
    assert_equal 1, @repository.find_all_by_credit_card_expiration_date("14").size
  end

  def test_finds_all_by_result
    assert_equal 2, @repository.find_all_by_result("pass").size
  end

  def test_finds_all_by_created_at
    assert_equal 2, @repository.find_all_by_created_at("b").size
  end

  def test_finds_all_by_updated_at
    assert_equal 2, @repository.find_all_by_updated_at("q").size
  end
end
