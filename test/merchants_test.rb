require_relative 'test_helper'

class MerchantsTest < Minitest::Test

  attr_reader :merchants

  def setup
    data = {id: "1",
            name: "Schroeder-Jerde",
            created_at: "2012-03-27 14:53:59 UTC",
            updated_at: "2012-03-27 14:53:59 UTC"
          }
    @merchants = Merchants.new(data)
  end

  def test_it_has_an_id
    setup
    assert_equal "1", merchants.id
  end

  def test_it_has_a_name
    setup
    assert_equal "schroeder-jerde", merchants.name
  end

  def test_it_has_meta_data
    setup
    assert_equal "2012-03-27", merchants.created_at
    assert_equal "2012-03-27", merchants.updated_at
  end

end
