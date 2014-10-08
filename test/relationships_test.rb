require 'test_helper'
require 'sales_engine'

class RelationshipsTest < Minitest::Test

  def setup
    sales_engine = SalesEngine.new
    item_repo = sales_engine.item_repository
  end

  

end
