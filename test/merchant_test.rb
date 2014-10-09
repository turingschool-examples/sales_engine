require_relative 'test_helper'
require 'merchant'
require 'date'

class MerchantTest < Minitest::Test

  def setup
    @merchant = Merchant.new({
      id:                                  "4",
      name:                   "Cummings-Thiel",
      created_at:    "2012-03-27 14:53:59 UTC",
      updated_at:    "2012-03-27 14:53:59 UTC"

      })
  end

  def test_successful_initialize_with_properties
    assert_equal                            "4", @merchant.id
    assert_includes        @merchant.created_at, "2012"
    assert_includes        @merchant.updated_at, "2012"
  end
end
