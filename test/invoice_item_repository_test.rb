require_relative 'test_helper'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/invoice_item'

class InvoiceItemRepositoryTest < Minitest::Test
  def setup
    invoice_item_one = InvoiceItem.new({id: "1", item_id: "5", invoice_id: "10", quantity: "9", unit_price: "78", created_at: "a", updated_at: "w" })
    invoice_item_two = InvoiceItem.new({id: "2", item_id: "8", invoice_id: "30", quantity: "2", unit_price: "89", created_at: "a", updated_at: "k" })
    invoice_item_three = InvoiceItem.new({id: "3", item_id: "2", invoice_id: "20", quantity: "4", unit_price: "55", created_at: "b", updated_at: "w" })
    @invoice_items = [invoice_item_one, invoice_item_two, invoice_item_three]
    @repository = InvoiceItemRepository.new(@invoice_items)
  end

  def test_returns_all
    assert_equal @invoice_items, @repository.all
  end

  def test_returns_random
    assert_instance_of InvoiceItem, @repository.random
  end

  def test_finds_by_id
    assert_equal @invoice_items[0], @repository.find_by_id("1")
  end

  def test_finds_by_item_id
    assert_equal @invoice_items[2], @repository.find_by_item_id("2")
  end

  def test_finds_by_invoice_id
    assert_equal @invoice_items[1], @repository.find_by_invoice_id("30")
  end

  def test_finds_by_quantity
    assert_equal @invoice_items[2], @repository.find_by_quantity("4")
  end

  def test_finds_by_unit_price
    assert_equal @invoice_items[2], @repository.find_by_unit_price("55")
  end

  def test_finds_by_created_at
    assert_equal @invoice_items[2], @repository.find_by_created_at("b")
  end

  def test_finds_by_updated_at
    assert_equal @invoice_items[1], @repository.find_by_updated_at("k")
  end

  def test_finds_all_by_id
    assert_equal 1, @repository.find_all_by_id("1").size
  end

  def test_finds_all_by_item_id
    assert_equal 0, @repository.find_all_by_item_id("88").size
  end

  def test_finds_all_by_invoice_id
    assert_equal 1, @repository.find_all_by_invoice_id("30").size
  end

  def test_finds_all_by_quantity
    assert_equal 1, @repository.find_all_by_quantity("9").size
  end

  def test_finds_all_by_unit_price
    assert_equal 0, @repository.find_all_by_unit_price("11").size
  end

  def test_finds_all_by_created_at
    assert_equal 2, @repository.find_all_by_created_at("a").size
  end

  def test_finds_all_by_updated_at
    assert_equal 2, @repository.find_all_by_updated_at("w").size
  end

end
