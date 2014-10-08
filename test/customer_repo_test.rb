require_relative 'helper_test'
require './lib/customer_repository'
require './lib/sales_engine'


class CustomerRepoTest < Minitest::Test

  def test_repo_gets_populated
    raw_csv = CSVParser.new.load_csv('./data/customers_test.csv')
    customer_repo = CustomerRepository.new(SalesEngine.new)
    customer_repo.populate_repository(raw_csv, Customer)
    assert_instance_of Customer, customer_repo.repo[0], "not instance of Customer"
    assert_instance_of Customer, customer_repo.repo[-1], "not instance of Customer"
  end

  def test_find_by_first_name
    skip
    raw_csv = CSVParser.new.load_csv('./data/customers_test.csv')
    customer_repo = CustomerRepository.new
    customer_repo.populate_repository(raw_csv, Customer)
    assert_equal customer_repo.repo[1], customer_repo.find_by_first_name("cecelia")
  end

  def test_find_by_created_at
    skip
    raw_csv = CSVParser.new.load_csv('./data/customers_test.csv')
    customer_repo = CustomerRepository.new
    customer_repo.populate_repository(raw_csv, Customer)
    require 'pry'
    binding.pry
    assert_equal customer_repo.repo[1], customer_repo.find_by_created_at("2012-03-27 14:54:10 UTC")
  end

end
