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
  #
  # def test_random_merchant
  #   entry = repository.randomize
  #   assert entry.respond_to?(:name)
  # end

  # def test_finds_matching_items_for_merchant_name
  #   entry = repository.find_by_name("Schroeder-Jerde")
  #   items = entry.item
  #   assert_equal 2, items.length
  #   items.each do |item|
  #     assert_equal "8888", item.merchant_id
  #   end
  # end
  #
  # def test_finds_matching_invoices_for_merchant_name
  #   invoices = repository.invoices("00000")
  #   assert_equal 1, invoices.length
  #   invoices.each do |invoice|
  #     assert_equal "00000", invoice.merchant_id
  #   end
  # end


end
