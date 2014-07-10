require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  attr_reader :repository

  def setup
    @repository = CustomerRepository.load('test/fixtures/small_customers.csv')
  end

  def test_find_by_id
    entry = repository.find_by_id(16)
    assert_equal 16, entry.id
  end

  def test_find_by_first_name
    entry = repository.find_by_first_name('Eileen')
    assert_equal 'Eileen', entry.first_name
  end

  def test_find_all_by_first_name
    entries = repository.find_all_by_first_name('Joey')
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal 'Joey', entry.first_name
    end
  end

  def test_find_by_last_name
    entry = repository.find_by_last_name('Braun')
    assert_equal 'Braun', entry.last_name
  end

  def test_find_all_last_name
    entries = repository.find_all_by_last_name('Kris')
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal 'Kris', entry.last_name
    end
  end

  def test_random
    entry = repository.random
    assert entry.respond_to?(:first_name)
  end
end
