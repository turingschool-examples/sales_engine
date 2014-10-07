require_relative 'test_helper'
require 'merchant'
require 'date'

class MerchantTest < Minitest::Test

  def setup
    @merchant = Merchant.new({
      id:                     =>  4,
      created_at:             =>  DateTime.parse("2012-03-27 14:53:59 UTC"),
      updated_at:             =>  DateTime.parse("2012-03-27 14:53:59 UTC")
      })
  end

  def test_successful_initialize_with_properties
    assert_equal                              4, @merchant.id
    assert_instance_of                 DateTime, @merchant.created_at
    assert_instance_of                 DateTime, @merchant.updated_at
  end

  def test_associated_item_with_object
    skip
    assert_instance_of                  Invoice, @merchant.invoices[0]
    assert_instance_of                     Item, @merchant.items[1]
  end
end
