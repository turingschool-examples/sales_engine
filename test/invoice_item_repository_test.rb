require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item_repository'
require './lib/load_data'

class InvoiceItemRepositoryTest < Minitest::Test
  include LoadData

  attr_reader :i

  def setup
    @i = InvoiceItemRepository.new(invoice_item_data("fixtures"), nil)
  end

  def test_that_random_returns_random_invoice_item_object
    assert_equal true, i.random.is_a?(InvoiceItem)
  end

  def test_can_find_by_id
    assert_equal "1", i.find_by_id("1").id
  end

  def test_find_all_by_id
    assert_equal 1, i.find_all_by_id("1").length
    end

  def test_find_by_item_id
    assert_equal "1", i.find_by_item_id("539").id
  end

  def test_find_all_by_item_id
    assert_equal 7, i.find_all_by_item_id("539").length
  end

  def test_find_by_invoice_id
    assert_equal "1", i.find_by_invoice_id("1").id
  end

  def test_find_all_by_invoice_id
    assert_equal 8, i.find_all_by_invoice_id("1").length
  end

  def test_find_by_quantity
    assert_equal "1", i.find_by_quantity("5").id
  end

  def test_find_all_by_quantity
    assert_equal 6, i.find_all_by_quantity("5").length
  end

  def test_find_by_unit_price
    assert_equal "1", i.find_by_unit_price("13635").id
  end

  def test_find_all_by_unit_price
    assert_equal 7, i.find_all_by_unit_price("13635").length
  end

  def test_find_by_created_at
    assert_equal "1", i.find_by_created_at("2012-03-27 14:54:09 UTC").id
  end

  def test_find_all_by_created_at
    assert_equal 15, i.find_all_by_created_at("2012-03-27 14:54:09 UTC").length
  end

  def test_find_by_updated_at
    assert_equal "1", i.find_by_updated_at("2012-03-27 14:54:09 UTC").id
  end

  def test_find_all_by_updated_at
    assert_equal 15, i.find_all_by_updated_at("2012-03-27 14:54:09 UTC").length
  end
end
