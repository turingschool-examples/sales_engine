require_relative '../lib/sales_engine'

class TestCustomerRepository < Minitest::Test
  def test_it_finds_customers_by_first_name
    data_directory = File.expand_path 'fixtures', __dir__

    # find_all_by_X(match) works just like find_by_X except it returns a collection of all matches.
    # If there is no match, it returns an empty Array.
    engine     = SalesEngine.new(data_directory)
    engine.startup
    repo       = engine.customer_repository
    sylvesters = repo.find_all_by_first_name("Sylvester")

    sylvesters.each do |mary|
      assert_equal "Sylvester", mary.first_name
    end

    assert_equal 2, sylvesters.length
  end
end
