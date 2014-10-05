require_relative 'test_helper.rb'
require_relative '../lib/invoice'
require 'time'

class InvoiceTest < Minitest::Test
  def setup
    data = {
      id:           '1',
      customer_id:  '2',
      merchant_id:  '3',
      status:       'shipped',
      created_at:   '2012-03-27 14:53:59 UTC',
      updated_at:   '2012-03-27 14:53:59 UTC'
    }
    @invoice = Invoice.new(data, nil)
  end

  def test_item_attribute_matches
    assert_equal 1, @invoice.id
    assert_equal 2, @invoice.customer_id
    assert_equal 3, @invoice.merchant_id
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @invoice.created_at
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @invoice.updated_at
  end
end
