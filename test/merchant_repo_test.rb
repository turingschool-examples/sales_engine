require_relative 'helper_test'
require './lib/merchant_repository'
require './lib/sales_engine'


class MerchantRepositoryTest < Minitest::Test

  def test_repo_gets_populated
    raw_csv = CSVParser.new.load_csv('./data/merchants_test.csv')
    merchant_repository = MerchantRepository.new(SalesEngine.new)
    merchant_repository.populate_repository(raw_csv, Merchant)
    assert_instance_of Merchant, merchant_repository.repository[0], "not instance of Merchant"
    assert_instance_of Merchant, merchant_repository.repository[-1], "not instance of Merchant"
  end

end
