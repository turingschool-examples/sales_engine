gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_repository'
require 'pry'

class MerchantRepositoryTest < Minitest::Test

  def test_find_by_id
    repository = MerchantRepository.new()
    repository.load('test/fixtures/small_merchants.csv')
    entry = repository.find_by_id('16')
    assert_equal "16", entry.id
  end

  def test_find_by_name
    repository = MerchantRepository.new()
    repository.load('test/fixtures/small_merchants.csv')
    entry = repository.find_by_name('Bosco, Howe and Davis')
    assert_equal "Bosco, Howe and Davis", entry.name
  end

  def test_find_all_by_name
    repository = MerchantRepository.new()
    repository.load('test/fixtures/small_merchants.csv')
    entries = repository.find_all_by_name('Bosco, Howe and Davis')
    assert_equal 2, entries.length
    entries.each do |entry|
      assert_equal "Bosco, Howe and Davis", entry.name
    end
  end

  def test_random_merchant
    repository = MerchantRepository.new()
    repository.load('test/fixtures/small_merchants.csv')
    entry = repository.random
    assert entry.respond_to?(:name)
  end

  def test_most_revenue
    item = Item.new(unit_price: '1111')
    item2 = Item.new(unit_price: '2222')
    item3 = Item.new(unit_price: '3333')
    merchant = Merchant.new(name: 'merchant', items: [item])
    merchant2 = Merchant.new(name: 'merchant2', items: [item, item2])
    merchant3 = Merchant.new(name: 'merchant3', items: [item, item2, item3])
    repository = MerchantRepository.new([merchant, merchant2, merchant3])
    most = repository.most_revenue(2)
    assert_equal 'merchant', most.first.name
  end
end
