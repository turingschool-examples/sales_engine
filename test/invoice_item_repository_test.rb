require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item_repository'
require './lib/load_data'
require './lib/sales_engine'
require './lib/item_repository'
require 'bigdecimal'

class InvoiceItemRepositoryTest < Minitest::Test
  include LoadData

  attr_reader :i

  def setup
    @i = InvoiceItemRepository.new(load_csv("fixtures", "invoice_items.csv"), SalesEngine.new)
  end

  def test_that_random_returns_random_invoice_item_object
    assert_equal true, i.random.is_a?(InvoiceItem)
  end

  def test_all_successful_invoice_items_returns_all
    assert_equal 12, i.successful_invoice_items.length
  end

  def test_all_method
    assert_equal 32, i.all.length
  end

  def test_find_by_id
    assert_equal 1, i.find_by_id(1).id
  end

  def test_find_all_by_id
    assert_equal 1, i.find_all_by_id(1).length
    end

  def test_find_by_item_id
    assert_equal 1, i.find_by_item_id(539).id
  end

  def test_find_all_by_item_id
    assert_equal 7, i.find_all_by_item_id(539).length
  end

  def test_find_by_invoice_id
    assert_equal 1, i.find_by_invoice_id(1).id
  end

  def test_find_all_by_invoice_id
    assert_equal 8, i.find_all_by_invoice_id(1).length
  end

  def test_find_by_quantity
    assert_equal 1, i.find_by_quantity(5).id
  end

  def test_find_all_by_quantity
    assert_equal 6, i.find_all_by_quantity(5).length
  end

  def test_find_by_unit_price
    assert_equal 1, i.find_by_unit_price(BigDecimal.new("13635") / 100).id
  end

  def test_find_all_by_unit_price
    assert_equal 7, i.find_all_by_unit_price(BigDecimal.new("13635") / 100).length
  end

  def test_find_by_created_at
    assert_equal 1, i.find_by_created_at("2012-03-27 14:54:09 UTC").id
  end

  def test_find_all_by_created_at
    assert_equal 15, i.find_all_by_created_at("2012-03-27 14:54:09 UTC").length
  end

  def test_find_by_updated_at
    assert_equal 1, i.find_by_updated_at("2012-03-27 14:54:09 UTC").id
  end

  def test_find_all_by_updated_at
    assert_equal 15, i.find_all_by_updated_at("2012-03-27 14:54:09 UTC").length
  end

  def test_inspect_returns_rows_in_ii_repository
    assert_equal "#<InvoiceItemRepository 32 rows>", i.inspect
  end

  def test_successful_invoice_items_returns_all_successful
    assert_equal 12, i.successful_invoice_items.length
  end

  def test_create_new_invoice_items_creates_new_invoice_items
    item_rep = ItemRepository.new(load_csv("fixtures", "items.csv"), SalesEngine.new)
    item_1 = item_rep.find_by_id(539)
    item_2 = item_rep.find_by_id(1)
    items = [item_1, item_2, item_1]
    i.create_new_invoice_items(items, id: 1)
    assert_equal 21664, i.invoice_items.last.id
  end
end
