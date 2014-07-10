gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_repository'


class InvoiceRepositoryTest < Minitest::Test

  attr_reader :repository

  def setup
    @repository = InvoiceRepository.load('test/fixtures/small_invoices.csv')
  end

  def test_find_by_id
    entry = repository.find_by_id(10)
    assert_equal 10, entry.id
  end

  def test_find_by_customer_id
    entry = repository.find_by_customer_id(5)
    assert_equal 5, entry.customer_id
  end

  def test_find_all_by_customer_id
    entries = repository.find_all_by_customer_id(4)
    assert_equal 6, entries.length
    entries.each do |entry|
      assert_equal 4, entry.customer_id
    end
  end

  def test_find_by_merchant_id
    entry = repository.find_by_merchant_id(75)
    assert_equal 75, entry.merchant_id
  end

  def test_find_all_by_merchant_id
    entries = repository.find_all_by_merchant_id(78)
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal 78, entry.merchant_id
    end
  end

  def test_find_by_status
    entry = repository.find_by_status('shipped')
    assert_equal "shipped", entry.status
  end

  def test_find_all_by_status
    entries = repository.find_all_by_status('shipped')
    assert_equal 20, entries.length
    entries.each do |entry|
      assert_equal "shipped", entry.status
    end
  end

  def test_random
    entry = repository.random
    assert entry.respond_to?(:status)
  end
end
