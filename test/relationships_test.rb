require_relative 'test_helper'
require './lib/sales_engine'

class RelationshipsTest < Minitest::Test

  def setup
    sales_engine          = SalesEngine.new
    sales_engine.startup #change to test files
    @item_repo             = sales_engine.item_repository
    merchant_repo         = sales_engine.merchant_repository
  end

  def test_item_merchant_method
   item = @item_repo.repo[0]
   assert_instance_of Merchant, item.merchant
  end


end
