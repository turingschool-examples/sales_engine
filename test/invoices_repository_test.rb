gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoices_repository'
require 'pry'

class InvoicesRepositoryTest < Minitest::Test

  attr_reader :repository

  def setup
    @repository ||= InvoicesRepository.load
  end

  def test_find_by_id
    entries = respository.find_by_id('10')
    assert_equal 1, entries.length
    entries.each do |entry|
      assert_equal "10", entry.id
    end
  end

  def test_find_by_customer_id
    skip
  end

  def test_find_by_merchant_id
    skip
  end

  def test_find_by_status
    skip
  end
end
