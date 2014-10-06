require_relative 'test_helper.rb'
require_relative '../lib/merchant'
require 'time'

class MerchantTest < Minitest::Test
  def setup
    data = {
      id:           '1',
      name:         'merchant of death',
      created_at:   '2012-03-27 14:53:59 UTC',
      updated_at:   '2012-03-27 14:53:59 UTC'
    }
    @merchant = Merchant.new(data, nil)
  end

  def test_merchant_attribute_matches
    assert_equal 1, @merchant.id
    assert_equal 'merchant of death', @merchant.name
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @merchant.created_at
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @merchant.updated_at
  end
end
