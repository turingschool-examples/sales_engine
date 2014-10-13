require_relative 'helper_test'
require './lib/transaction_repository'
require './lib/sales_engine'

class TransactionRepoTest < Minitest::Test

  def test_repo_gets_populated
    transaction_repository = TransactionRepository.new(SalesEngine.new, "./data")
    transaction_repository.make_repo
    assert_instance_of Transaction, transaction_repository.repository[0], "not instance of Transaction"
    assert_instance_of Transaction, transaction_repository.repository[-1], "not instance of Transaction"
  end
end
