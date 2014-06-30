gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_repository'
require 'pry'

class MerchantRepositoryTest < Minitest::Test

  attr_reader :repository

  def setup
    @repository ||= MerchantRepository.load
  end

  def test_find_by_id
    entries = repository.find_by_id('16')
    assert_equal 1, entries.length
    entries.each do |entry|
      assert_equal "16", entry.id
    end
  end

  def test_find_by_name
    entry = repository.find_by_name('Bosco, Howe and Davis')
    assert_equal "Bosco, Howe and Davis", entry.name
  end

  def test_find_all_by_name
    entries = repository.find_all_by_name('Bosco, Howe and Davis')
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal "Bosco, Howe and Davis", entry.name
    end
  end

  def test_random_merchant
    entry = repository.randomize
    assert entry.respond_to?(:name)
  end

end
