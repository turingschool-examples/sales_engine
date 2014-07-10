gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item_repository'


class InvoiceItemRepositoryTest < Minitest::Test

  attr_reader :repository

  def setup
    @repository = InvoiceItemRepository.load('test/fixtures/small_invoice_items.csv')
  end

  def test_find_by_id
    entry = repository.find_by_id(8)
    assert_equal 8, entry.id
  end

  def test_find_by_item_id
    entry = repository.find_by_item_id(528)
    assert_equal 528, entry.item_id
  end

  def test_find_all_by_item_id
    entries = repository.find_all_by_item_id(539)
    assert_equal 3, entries.length
    entries.each do |entry|
      assert_equal 539, entry.item_id
    end
  end

  def test_find_by_invoice_id
    entry = repository.find_by_invoice_id(2)
    assert_equal 2, entry.invoice_id
  end

  def test_find_all_by_invoice_id
    entries = repository.find_all_by_invoice_id(3)
    assert_equal 8, entries.length
    entries.each do |entry|
      assert_equal 3, entry.invoice_id
    end
  end

  def test_find_by_quantity
    entry = repository.find_by_quantity(5)
    assert_equal 5, entry.quantity
  end

  def test_find_all_by_quantity
    entries = repository.find_all_by_quantity(19)
    assert_equal 3, entries.length
    entries.each do |entry|
      assert_equal 19, entry.quantity
    end
  end

  def test_find_by_unit_price
    entry = repository.find_by_unit_price(BigDecimal.new('20.00'))
    assert_equal 10, entry.id
  end

  def test_find_all_by_unit_price
    entries = repository.find_all_by_unit_price(BigDecimal.new('19.99'))
    assert_equal 3, entries.length
  end

  def test_random
    entry = repository.random
    assert entry.respond_to?(:quantity)
  end

end
