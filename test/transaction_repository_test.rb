require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  attr_reader :repository

  def setup
    @repository = TransactionRepository.new(self)
    @repository.load('test/fixtures/small_transaction.csv')
  end

  def test_find_by_id
    entries = repository.find_by_id('4')
    assert_equal 1, entries.length
    entries.each do |entry|
      assert_equal '4', entry.id
    end
  end

  def test_find_all_by_invoice_id
    entries = repository.find_all_invoice_id('12')
    assert_equal 3, entries.length
    entries.each do |entry|
      assert_equal '12', entry.invoice_id
    end
  end

  def test_find_by_invoice_id
    entry = repository.find_by_invoice_id('13')
    assert_equal '13', entry.invoice_id
  end

end
