require_relative 'test_helper.rb'
require_relative '../lib/customer'
require 'time'

class CustomerTest < Minitest::Test
  def setup
    data = {
      id:         '1',
      first_name: 'Carl',
      last_name:  'Carlson',
      created_at: '2012-03-27 14:53:59 UTC',
      updated_at: '2012-03-27 14:53:59 UTC'
    }
    @customer = Customer.new(data, nil)
  end

  def test_customer_attribute_matches
    assert_equal 1, @customer.id
    assert_equal 'Carl', @customer.first_name
    assert_equal 'Carlson', @customer.last_name
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @customer.created_at
    assert_equal Time.parse('2012-03-27 14:53:59 UTC'), @customer.updated_at
  end
end
