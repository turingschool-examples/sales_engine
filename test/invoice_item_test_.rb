require_relative 'test_helper'
require 'invoice_item'
require 'date'

class InvoiceItemTest < Minitest::Test

  def setup
    @invoice_item = InvoiceItem.new({
      id:           =>  4,
      item_id:      =>  54,
      invoice_id:   =>  55,
      quantity:     =>  5,
      unit_price:   =>  12,
      created_at:   =>  DateTime.parse("2012-03-27 14:54:10 UTC"),
      updated_at:   =>  DateTime.parse("2012-03-27 14:54:09 UTC")
      })
  end

  def test_successful_initialize_with_properties
    assert_equal                 4, @invoice_item.id
    assert_equal                54, @invoice_item.item_id
    assert_equal                55, @invoice_item.invoice_id
    assert_equal                 5, @invoice_item.quantity
    assert_equal                12, @invoice_item.unit_price
    assert_instance_of    DateTime, @invoice_item.created_at
    assert_instance_of    DateTime, @invoice_item.updated_at
  end

  def test_associated_item_with_object
    skip
    assert_instance_of       Item, @invoice_item.item
    assert_instance_of    Invoice, @invoice_item.invoice
  end

end


#
# def generate_invoice_item(invoice_item_id)
#   wanted_info = invoice_item_csv.retrieve_info(invoice_item_id)
#   InvoiceItem.new(wanted_info) # wanted_info = :unit_price => 23, :created_at => Date, etc.
# end
