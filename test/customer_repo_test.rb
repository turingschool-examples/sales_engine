require_relative 'test_helper'
require './lib/customer_repository'

class CustomerRepoTest < Minitest::Test

def test_repo_gets_populated
  raw_csv = CSVParser.new.load_csv('./data/customers_test.csv')
  customer_repo = CustomerRepository.new
  customer_repo.populate_repository(raw_csv, Customer)
  assert_instance_of Customer, customer_repo.repo[0], "not instance of Customer"
  assert_instance_of Customer, customer_repo.repo[-1], "not instance of Customer"
end

end
