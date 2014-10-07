require_relative 'test_helper'
require 'item'

class ItemTest < Minitest::Test

  def setup
    @item = Item.new({
      id:               =>  4,
      description:      =>  "Sunt eum id eius magni."
      name:             =>  "Item Nemo Facere"
      })
  end

  def test_successful_initialize_with_properties
    assert_equal                              4, @item.id
    assert_equal      "Sunt eum id eius magni.", @item.item_id
    assert_equal             "Item Nemo Facere", @item.invoice_id
  end

  def test_associated_item_with_object
    skip
    assert_instance_of       InvoiceItem, @item.invoice_items[0]
    assert_instance_of          Merchant, @item.merchant
  end
end
