require_relative 'helper_test'
require './lib/merchant_repository'
require './lib/sales_engine'


class MerchantRepositoryTest < Minitest::Test

  def test_repo_gets_populated
    merchant_repository = MerchantRepository.new(SalesEngine.new, "./data")
    merchant_repository.make_repo
    assert_instance_of Merchant, merchant_repository.repository[0], "not instance of Merchant"
    assert_instance_of Merchant, merchant_repository.repository[-1], "not instance of Merchant"
  end
end
