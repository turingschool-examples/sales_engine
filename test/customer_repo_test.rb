require_relative 'helper_test'
require './lib/customer_repository'
require './lib/sales_engine'


class CustomerRepoTest < Minitest::Test

  def test_repo_gets_populated
    customer_repository = CustomerRepository.new(SalesEngine.new, "./data")
    customer_repository.make_repo
    assert_instance_of Customer, customer_repository.repository[0], "not instance of Customer"
    assert_instance_of Customer, customer_repository.repository[-1], "not instance of Customer"
  end

  def test_find_by_first_name
    customer_repository = CustomerRepository.new(SalesEngine.new, "./data")
    customer_repository.make_repo
    assert_equal customer_repository.repository[1], customer_repository.find_by_first_name("cecelia")
  end

  def test_find_by_created_at
    customer_repository = CustomerRepository.new(SalesEngine.new, "./data")
    customer_repository.make_repo
    assert_equal customer_repository.repository[1], customer_repository.find_by_created_at("2012-03-27 14:54:10 UTC")
  end

end
