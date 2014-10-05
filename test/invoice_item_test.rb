require_relative 'test_helper.rb'
require_relative '../lib/invoice_item'
require 'bigdecimal'
require 'bigdecimal/util'
require 'time'

class InvoiceItemTest < Minitest::Test
  def setup
    data = {
      id:           '1',
      item_id:      '2',
      invoice_id:   '3',
      quantity:     '99',
      unit_price:   '75107',
      created_at:   '2012-03-27 14:53:59 UTC',
      updated_at:   '2012-03-27 14:53:59 UTC'
    }
    @invoice_item = InvoiceItem.new(data, nil)
  end

  def test_invoice_item_attribute_matches
    assert_equal 1, @invoice_item.id
    assert_equal 2, @invoice_item.item_id
    assert_equal 3, @invoice_item.invoice_id
    assert_equal 99, @invoice_item.quantity
    assert_equal '75107'.to_d, @invoice_item.unit_price
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @invoice_item.created_at
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @invoice_item.updated_at
  end
end
