require_relative 'test_helper'
require './lib/merchant_repository'
require './lib/sales_engine'


class MerchantRepositoryTest < Minitest::Test

  def test_repo_gets_populated
    raw_csv = CSVParser.new.load_csv('./data/merchants_test.csv')
    merchant_repo = MerchantRepository.new(SalesEngine.new)
    merchant_repo.populate_repository(raw_csv, Merchant)
    assert_instance_of Merchant, merchant_repo.repo[0], "not instance of Merchant"
    assert_instance_of Merchant, merchant_repo.repo[-1], "not instance of Merchant"
  end

end
